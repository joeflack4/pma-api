"""App management utilities"""
import os
import subprocess
from datetime import datetime
from typing import List
from uuid import uuid4 as random_uuid

from pma_api.error import PmaApiException
from pma_api.config import ERROR_LOG_PATH, LOGS_DIR


def log_process_stderr(stderr_obj, err_msg: str = None):
    """Log stderr output from process

    Args:
        stderr_obj: Stderr object
        err_msg (str): Custom error message
    """
    err = err_msg + '\n\nFor more information, search for error details by ' \
                    'id "{}" in logfile "{}".\n'
    log_msg = ''

    try:
        for line in iter(stderr_obj.readline, ''):
            try:
                log_msg += line.encode('utf-8')
            except TypeError:
                log_msg += str(line)
    except AttributeError:
        log_msg: str = stderr_obj

    if log_msg:
        uuid = str(random_uuid())
        log_msg_open = '<error id="{}" datetime="{}">' \
            .format(uuid, str(datetime.now()))
        log_msg_close = '</' + log_msg_open[1:]
        log_msg = '\n\n' + \
                  log_msg_open + '\n' + log_msg + '\n' + log_msg_close
        if not os.path.exists(LOGS_DIR):
            os.mkdir(LOGS_DIR)
        with open(ERROR_LOG_PATH, 'a') as log:
            log.writelines(log_msg)
        err = err.format(uuid, ERROR_LOG_PATH)

        raise PmaApiException(err)


def run_proc_and_log_errs(cmd: List):
    """Run process and log errors, if any

    Args:
        cmd (list): Command to be executed to run process
    """
    proc = subprocess.Popen(cmd, stderr=subprocess.PIPE,
                            universal_newlines=True)

    if proc.stderr:
        log_process_stderr(proc.stderr)

    proc.stderr.close()
    proc.wait()


def run_proc(cmd, shell: bool = False) -> {str: str}:
    """Run a process

    Helper function to run a process, for boilerplate reduction.

    Args:
        cmd (str | list): Command to run
        shell (bool): Shell argument to pass to subprocess.Popen

    Returns:
        dict: {
            'stdout': Popen.stdout.read(),
            'stderr': Popen.stderr.read()
        }
    """
    cmd_args: List[str] = \
        cmd.split(' ') if isinstance(cmd, str) \
        else cmd

    proc = subprocess.Popen(
        cmd_args,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
        shell=shell)

    outs: str = proc.stdout.read()
    errs: str = proc.stderr.read()

    proc.stderr.close()
    proc.stdout.close()
    proc.wait()

    output = {
        'stdout': outs,
        'stderr': errs}

    return output
