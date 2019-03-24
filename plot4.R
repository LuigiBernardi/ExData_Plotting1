# READ AND SELECT DATA

library(tidyverse) # I used tidyverse for getting and cleaning data

power_cons_full <- read_delim("household_power_consumption.txt",
                              delim = ";",
                              col_types = "ccddddddd",
                              na = "?")

power_cons <- power_cons_full %>%
      mutate(date_time = as.POSIXct(strptime(paste(Date, Time), format = "%d/%m/%Y %T"))) %>% 
      filter(date_time >= "2007-02-01 00:00:00" & date_time <= "2007-02-02 23:59:59")

# PLOT

# NB my locale is italian so on x axis you see these abbreviations gio (thursday), ven (friday) and sab (saturday)

par(mfrow = c(2,2))

# top left plot

with(power_cons, plot(date_time, Global_active_power,
                      type = "l",
                      xlab = "",
                      ylab = "Global Active Power (kilowatts)"))

# top right plot

with(power_cons, plot(date_time, Voltage,
                      type = "l",
                      xlab = "datetime",
                      ylab = "Voltage"))

# bottom left plot

with(power_cons, plot(date_time, Sub_metering_1,
                      type = "l",
                      xlab = "",
                      ylab = "Energy sub metering"))

with(power_cons, lines(date_time, Sub_metering_2,
                       type = "l",
                       col = "red"))

with(power_cons, lines(date_time, Sub_metering_3,
                       type = "l",
                       col = "blue"))

legend("topright",
       inset = 0.01,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       cex = 0.8,
       box.lty = 0)

# bottom right plot

with(power_cons, plot(date_time, Global_reactive_power,
                      type = "l",
                      xlab = "datetime",
                      ylab = "Global_reactive_power"))

dev.copy(png, file = "plot4.png")
dev.off()