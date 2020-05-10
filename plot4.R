library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coaltype <- grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector)
coaltype <- SCC$SCC[coaltype]
coal <- filter(NEI, SCC %in% coaltype)
  
yearly <- group_by(coal, year)
summary <- summarise(yearly, "coal_emissions" = sum(Emissions))

qplot(year, coal_emissions, data = summary, main = "Coal Emissions in the US")

## save as a png file

dev.copy(png,"plot4.png")
dev.off()
