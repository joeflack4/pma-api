
# Actual time elapsed by 'n': 'seconds' (for 'R'): 

n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
seconds <- c(48, 72, 99, 67, 177, 137, 252, 135, 320, 1906)
model <- lm(seconds ~ n)
summary(model)

plot(x=n, y=seconds, xlab='N data rows', ylab='Seconds',
    main='PMA API Data Upload Performance',
    panel.last = lines(sort(n), fitted(model)[order(n)]))
