"""Server management"""
import os
import signal
import sys
from typing import List

import psutil
# noinspection PyProtectedMember
from psutil._exceptions import ZombieProcess

from pma_api.config import PID_FILE_PATH, PROJECT_ROOT_PATH
from pma_api.manage.utils import run_proc_and_log_errs


def stop_server(pid: int = None, pid_file_path: str = PID_FILE_PATH):
    """Stop server

    Args:
        pid (int): Process id
        pid_file_path (str): Path to read/write pid file

    Side effects:
        - Stops server
        - Writes to pid file
    """
    if pid:
        target_pid = pid
    else:
        with open(pid_file_path, 'r') as f:
            found = f.read()
            target_pid = int(found) if found else None

    if target_pid:
        os.kill(target_pid, signal.SIGTERM)
        if os.path.exists(pid_file_path):
            with open(pid_file_path, 'w') as f:
                f.write('')


def start_dev_server():
    """Start development server"""
    cmd = 'python {} runserver'\
        .format(os.path.join(PROJECT_ROOT_PATH, 'manage.py'))\
        .split(' ')
    run_proc_and_log_errs(cmd)


def start_prod_server():
    """Start production server"""
    cmd = 'gunicorn --chdir {} {} -D -p {}'\
        .format(PROJECT_ROOT_PATH, 'run:app', 'pma-api_process-id.pid')\
        .split(' ')
    run_proc_and_log_errs(cmd)


def start_server():
    """Start server"""
    env = os.getenv('ENV_NAME', 'development')
    if env == 'development':
        start_dev_server()
    else:
        start_prod_server()


def get_server_pid():
    """Get process id of this server being run

    Returns:
        int: process id
    """
    server_start_args: str = ' '.join(sys.argv)

    python_procs: List[psutil.Process] = [
        x for x in psutil.process_iter()
        if x.name().startswith('python')]

    active_procs: List[psutil.Process] = []
    proc_init_commands: List[str] = []
    for proc in python_procs:
        try:
            init_cmd: List[str] = proc.cmdline()
            proc_init_commands.append(' '.join(init_cmd))
            active_procs.append(proc)
        except ZombieProcess:
            continue

    server_procs_commands = \
        [x for x in proc_init_commands if server_start_args in x]
    server_procs = [
        x for x in active_procs
        if ' '.join(x.cmdline()) in server_procs_commands]

    return server_procs[0].pid


def store_pid(path: str = PID_FILE_PATH):
    """Store prcocess id

    This should be called in the module used to run the server, right before
    any lines to execute running server

    Args:
         path (str): Path to file to store process id
    """
    pid = get_server_pid()

    with open(path, 'w') as f:
        f.write(str(pid))
