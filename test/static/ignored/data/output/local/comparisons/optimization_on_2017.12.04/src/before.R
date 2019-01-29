# Actual time elapsed by 'n': 'seconds' (for 'R'): 

n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 72000)
seconds <- c(9, 10, 11, 13, 17, 28, 57, 92, 905)

model <- lm(seconds ~ n)
summary(model)

plot(x=n, y=seconds,
     xlab='N data rows', ylab='Seconds', main='PMA API Data Upload Performance, Remote', 
     panel.last = lines(sort(n), fitted(model)[order(n)]))
