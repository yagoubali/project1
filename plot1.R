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
png("plot1.png",480,480) ## png device
with (sub_data, hist(as.numeric(as.character(Global_active_power)),col="red",main ="Global Active Power",xlab = 'Global Active Power(Kilowatts)', ))
dev.off() ## close device
