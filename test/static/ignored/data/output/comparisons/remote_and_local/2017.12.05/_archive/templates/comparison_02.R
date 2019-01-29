# Actual time elapsed by 'n': 'seconds' (for 'R'): 

seconds1 <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 72000)
n1 <- c(9, 10, 11, 13, 17, 28, 57, 92, 905)
model1 <- lm(seconds1 ~ n1)
seconds2 <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
n2 <- c(11, 12, 8, 12, 8, 9, 39, 29, 29, 213)
# model2 <- lm(seconds2 ~ n2)

plot(x=n1, y=seconds1,
     xlab='Seconds', ylab='# data rows uploaded', 
     main='PMA API Data Upload Performance, 2017/12/04 Update', col='dark red',
     # sub='Before and after: 2017/12/04 Performance Update',
     panel.last = lines(sort(n1), fitted(model1)[order(n1)], col='dark red'))
lines(x=n2, y=seconds2, col='dark green')
legend(600,10000, c('before', 'after'), lty=c(1,1), lwd=c(2.5,2.5), col=c('dark red', 'dark green'))
