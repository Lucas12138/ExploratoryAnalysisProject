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
par(mar = c(4, 4, 1, 1), mfrow = c(1, 1))
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
legend(
        "topright",
        col = c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1,
        lwd = 1
)
#Save to PNG
dev.copy(
        device = png,
        file = "plot3.png",
        height = 480,
        width = 480
)
dev.off()