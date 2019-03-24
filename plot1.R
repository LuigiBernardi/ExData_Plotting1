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

hist(power_cons$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()
