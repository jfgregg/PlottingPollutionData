library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicletype <- grep("[Vv]ehicle", SCC$EI.Sector)
vehicletype <- SCC$SCC[vehicletype]
baltvehicles <- filter(NEI, fips == "24510" & SCC %in% vehicletype)

yearly <- group_by(baltvehicles, year, fips)
summary <- summarise(yearly, "vehicle_emissions" = sum(Emissions))

qplot(year, vehicle_emissions, data = summary, main = "Vehicle Emissions in Baltimore")

## save as a png file

dev.copy(png,"plot5.png")
dev.off()
