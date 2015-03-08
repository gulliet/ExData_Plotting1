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
     type = 'l',
     xaxt = 'n',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')
axis(1, at = c(0, nrow(df)/2, nrow(df)), labels = c('Thu', 'Fri', 'Sat'))

dev.copy(png, file = 'plot4.png')
dev.off()
