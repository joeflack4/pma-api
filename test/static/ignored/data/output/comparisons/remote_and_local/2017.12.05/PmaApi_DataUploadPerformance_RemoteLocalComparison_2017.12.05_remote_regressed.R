# Actual time elapsed by 'n': 'seconds' (for 'R'): 

local_n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
local_seconds <- c(11, 12, 8, 12, 8, 9, 39, 29, 29, 213)
# local_model <- lm(local_seconds ~ local_n)

remote_n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
remote_seconds <- c(48, 72, 99, 67, 177, 137, 252, 135, 320, 1906)
remote_model <- lm(remote_seconds ~ remote_n)

plot(x=remote_n, y=remote_seconds,
     xlab='N data rows', ylab='Seconds', 
     main='PMA API Data Upload Performance, Remote and Local', col='dark red',
     # sub='(Remote and local, remote regressed)',
     panel.last = lines(sort(remote_n), fitted(remote_model)[order(remote_n)], col='dark red'),
     xlim=c(0, 70000), ylim=c(0, 2000))
lines(x=local_n, y=local_seconds, col='dark green')
legend(5000,1900, c('remote', 'local'), lty=c(1,1), lwd=c(2.5,2.5), col=c('dark red', 'dark green'))
