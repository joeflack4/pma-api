# Actual time elapsed by 'n': 'seconds' (for 'R'): 

local_n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
local_seconds <- c(11, 12, 8, 12, 8, 9, 39, 29, 29, 213)
local_model <- lm(local_seconds ~ local_n)

remote_n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
remote_seconds <- c(48, 72, 99, 67, 177, 137, 252, 135, 320, 1906)
# remote_model <- lm(remote_seconds ~ remote_n)

plot(x=local_n, y=local_seconds,
     xlab='N data rows', ylab='Seconds', 
     main='PMA API Data Upload Performance, Remote and Local', col='dark green',
     # sub='(Remote and local, local regressed)',
     panel.last = lines(sort(local_n), fitted(local_model)[order(local_n)], col='dark green'),
     xlim=c(0, 70000), ylim=c(0, 2000))
lines(x=remote_n, y=remote_seconds, col='dark red')
legend(5000,1900, c('local', 'remote'), lty=c(1,1), lwd=c(2.5,2.5), col=c('dark green', 'dark red'))
