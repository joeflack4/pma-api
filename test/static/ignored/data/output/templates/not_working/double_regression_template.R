# Actual time elapsed by 'n': 'seconds' (for 'R'): 

n1 <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
seconds1 <- c(10, 11, 19, 13, 20, 29, 56, 101, 165, 921)
model1 <- lm(seconds1 ~ n1)

n2 <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
seconds2 <- c(10, 11, 19, 13, 20, 29, 56, 101, 165, 921)
model2 <- lm(seconds2 ~ n2)

# plot(x=n1, y=seconds1,
#      xlab='N data rows', ylab='Seconds', main='PMA API Data Upload Performance, Local', 
#     panel.last = lines(sort(n), fitted(model1)[order(n)]), col='blue')

#lines(x=n2, y=seconds2,
#     xlab='N data rows', ylab='Seconds', main='PMA API Data Upload Performance, Local', 
#     panel.last = lines(sort(n), fitted(model2)[order(n)]), col='red')
# library(melt)
library(ggplot2)
# ggplot(data=melt(n1, seconds1), aes(x=n1, y=seconds1)) + geom_point() +
ggplot(aes(x=n1, y=seconds1)) + geom_point() +
  geom_smooth(method="lm", se=FALSE)
