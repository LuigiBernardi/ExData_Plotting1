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

with(power_cons, plot(date_time, Global_active_power,
                      type = "l",
                      xlab = "",
                      ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()
