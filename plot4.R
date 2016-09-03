data_full <-
        read.table(
                "household_power_consumption.txt",
                header = TRUE,
                sep = ';',
                na.strings = "?",
                nrows = 2075259,
                check.names = FALSE,
                stringsAsFactors = FALSE,
                comment.char = "",
                quote = '\"'
        )
data_full$Date <- as.Date(x = data_full$Date, format = "%d/%m/%Y")
data <-
        subset(data_full, subset = (Date >= "2007-02-01" &
                                            Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
par(mar=c(2.5,2.5,0.5,0.5),mfrow = c(2, 2),omar=c(1,1,1,1))
?par
#1
plot(
        data$Global_active_power ~ data$Datetime,
        xlab = "",
        ylab = "Global Active Power (kilowatts)",
        type =  "l"
)
#2
plot(
        data$Voltage ~ data$Datetime,
        type = "l",
        xlab = "datetime",
        ylab = "Voltage"
)
#3
plot(
        data$Sub_metering_1 ~ data$Datetime,
        type = "l",
        col = "black",
        xlab = "",
        ylab = "Energy sub metering"
)
lines(data$Sub_metering_2 ~ data$Datetime,
      type = "l",
      col = "red")
lines(data$Sub_metering_3 ~ data$Datetime,
      type = "l",
      col = "blue")
#4
plot(
        data$Global_reactive_power ~ data$Datetime,
        type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power"
)
#Save to PNG
dev.copy(
        device = png,
        file = "plot4.png",
        height = 480,
        width = 480
)
dev.off()