# Actual time elapsed by 'n': 'seconds' (for 'R'): 

n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
seconds <- c(10, 11, 19, 13, 20, 29, 56, 101, 165, 921)

model <- lm(seconds ~ n)
summary(model)

plot(x=n, y=seconds,
      xlab='N data rows', ylab='Seconds', main='PMA API Data Upload Performance', 
     panel.last = lines(sort(n), fitted(model)[order(n)]))
