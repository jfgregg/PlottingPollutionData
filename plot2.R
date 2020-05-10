library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- filter(NEI, fips == "24510")

yearly <- group_by(baltimore, year)
summary <- summarise(yearly, "total_emissions" = sum(Emissions))
x <- summary$year
y <- summary$total_emissions
plot(x,y, xlab = "Year", ylab = "Emissions", main = "Emissions by year in Baltimore")

## save as a png file

dev.copy(png,"plot2.png")
dev.off()
