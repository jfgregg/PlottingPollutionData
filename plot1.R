library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearly <- group_by(NEI, year)
summary <- summarise(yearly, "total_emissions" = sum(Emissions))
x <- summary$year
y <- summary$total_emissions

plot(x,y, xlab = "Year", ylab = "Total Emissions", main = "Emissions by Year in the US")

## save as a png file

dev.copy(png,"plot1.png")
dev.off()
