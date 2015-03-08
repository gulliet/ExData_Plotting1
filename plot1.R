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

hist(df$Global_active_power, 
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')

dev.copy(png, file = 'plot1.png')
dev.off()
