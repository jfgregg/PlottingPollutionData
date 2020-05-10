library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicletype <- grep("[Vv]ehicle", SCC$EI.Sector)
vehicletype <- SCC$SCC[vehicletype]
baltlavehicles <- filter(NEI, (fips == "24510" | fips == "06037") & SCC %in% vehicletype)
baltlavehicles$fips[baltlavehicles$fips=="24510"]<- "Baltimore City"
baltlavehicles$fips[baltlavehicles$fips=="06037"]<- "Los Angeles County"

yearly <- group_by(baltlavehicles, year, fips)
summary <- summarise(yearly, "vehicle_emissions" = sum(Emissions))

qplot(year, vehicle_emissions, data = summary, col = fips, main = "Vehicle Emissions Baltimore v LA")

## save as a png file

dev.copy(png,"plot6.png")
dev.off()
