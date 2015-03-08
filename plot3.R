setAs("character", "myDate", function(from) as.Date(from, format = "%d/%m/%Y"))
setClass('myDate')
setAs("character", "myTime", function(from) strptime(from, format = "%H:%M:%S"))
setClass('myTime')

data <- read.table('household_power_consumption.txt', 
                   header = TRUE,
                   sep = ";",
                   quote = "",
                   na.strings = "?",
                   colClasses = c('myDate', 'myTime', rep('numeric', 7)),
                   nrows = 2075259,
                   comment.char = "")

df <- subset(data, 
             Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

plot(df$Global_active_power, 
     type = 'n',
     xaxt = 'n',
     xlab = '',
     ylab = 'Energy sub metering',
     ylim = c(0, 39))
axis(1, at = c(0, nrow(df)/2, nrow(df)), labels = c('Thu', 'Fri', 'Sat'))
points(df$Sub_metering_1, type = 'l', col = 'blue')
points(df$Sub_metering_2, type = 'l', col = 'red')
points(df$Sub_metering_3, type = 'l', col = 'green')
legend('topright', pch = '-', col = c('blue', 'red', 'green'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.copy(png, file = 'plot3.png')
dev.off()
