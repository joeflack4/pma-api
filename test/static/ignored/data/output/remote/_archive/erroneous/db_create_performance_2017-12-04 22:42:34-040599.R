
        # Actual time elapsed by 'n': 'seconds' (for 'R'): 


        
        n <- c(0)

        seconds <- c(1547)

        model <- lm(seconds ~ n)

        summary(model)



        plot(x=n, y=seconds, xlab='N data rows', ylab='Seconds',
        main='PMA API Data Upload Performance',
        panel.last = lines(sort(n), fitted(model)(order(n))))
        