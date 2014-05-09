##read data 
ExData_Plotting1  = read.table("household_power_consumption.txt",header=T,sep=";")
dim(ExData_Plotting1) # to check the NO of rows and No of col.
head(ExData_Plotting1)
dates = as.Date(ExData_Plotting1$Date,format="%d/%m/%Y") # convert to data object
dates_1 = which(dates == as.Date( "01/02/2007",format="%d/%m/%Y")) ### retrun indexes of first day
length(dates_1) ## checkl length 
dates_2 = which(dates == as.Date("02/02/2007",format="%d/%m/%Y")) ## retrun indexes of second day
length(dates_2) ## check length
dates_two = c(dates_1,dates_2) ## combine the indexes of two days
sub_data = ExData_Plotting1[dates_two,] ### select interested sub data
head(sub_data) # check  sub data
png("plot4.png",480,480) ## png device

par(mfrow=c(2,2))
with(sub_data,{
plot(as.numeric(as.character(Global_active_power)), type='l',xaxt='n',ylab='',xlab='')
axis(1, c(0,length(sub_data$Global_active_power)/2,length(sub_data$Global_active_power)), c("Thu","Fri","Sat"))
title( ylab = 'Global Active Power(Kilowatts)')

plot(as.numeric(as.character(Voltage)), type='l',xaxt='n',ylab='',xlab='')
title(ylab="Voltage",xlab = 'datetime')
axis(1, c(0,length(sub_data$Voltage)/2,length(sub_data$Voltage)), c("Thu","Fri","Sat"),lwd=2)

plot(as.numeric(as.character(Sub_metering_1)),type="l",ylim=c(0,40),yaxt='n',ylab="",xlab="",xaxt='n')
par( new=TRUE)
plot(as.numeric(as.character(Sub_metering_2)),type="l",ylim=c(0,40),yaxt='n',ylab="",xlab="",col='red',xaxt='n')
par( new=TRUE)
plot(as.numeric(as.character(Sub_metering_3)),type="l",ylim=c(0,40),yaxt='n',ylab="",xlab="",col='blue',xaxt='n')
title(ylab="Engergy sub metering")
axis(1,c(0,length(sub_data$Sub_metering_1)/2, length(sub_data$Sub_metering_1)),c("Thu","Fri","Sat"))
axis(2,c(0,10,20,30),c(0,10,20,30),lwd=2)
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"),lty=1)

plot(as.numeric(as.character(Global_reactive_power)), type='l',xaxt='n',ylab='',xlab='')
title(ylab ="Global_reactive_power",xlab="datetime")
axis(1, c(0,length(sub_data$Global_active_power)/2,length(sub_data$Global_active_power)), c("Thu","Fri","Sat"))
})
dev.off()
