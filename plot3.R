library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")

yearlytype <- group_by(baltimore, year, type)
summary <- summarise(yearlytype, "total_emissions" = sum(Emissions))

qplot(year, total_emissions, data = summary, color = type, main = "Emissions by Type in Baltimore")

## save as a png file

dev.copy(png,"plot3.png")
dev.off()
