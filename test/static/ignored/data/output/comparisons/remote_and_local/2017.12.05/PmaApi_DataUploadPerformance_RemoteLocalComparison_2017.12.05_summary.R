# Actual time elapsed by 'n': 'seconds' (for 'R'): 

n <- c(90, 180, 360, 450, 900, 1800, 3600, 7200, 14402, 72000)
local_n <- n
local_seconds <- c(11, 12, 8, 12, 8, 9, 39, 29, 29, 213)
local_model <- lm(local_seconds ~ local_n)
attributes(summary(local_model)$coefficients)
local_slope <- summary(local_model)$coefficients[2]

remote_n <- n
remote_seconds <- c(48, 72, 99, 67, 177, 137, 252, 135, 320, 1906)
remote_model <- lm(remote_seconds ~ remote_n)
remote_slope <- summary(remote_model)$coefficients[2]

x <- remote_over_local_upload_time_multiplier <- remote_slope / local_slope
y <- remote_over_local_time_required_by_n <- remote_seconds / local_seconds

paste('remote_over_local_time_required_by_n: ')
n
y
paste('remote_over_local_upload_time_multiplier: ', x)
