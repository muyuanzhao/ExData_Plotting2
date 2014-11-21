NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalIndex <- grep ("Coal", SCC$EI.Sector)
coal <- SCC[coalIndex,] # get rows for coal
coalmerged <- merge(NEI,coal,by.x="SCC",by.y="SCC")
coaltotals <- aggregate(Emissions ~ year, data=coalmerged, sum)

library (ggplot2)
png(filename="plot4.png", width = 480, height = 480)
qplot(year,Emissions,data=coaltotals,
      geom="line",
      main = "Coal Combustion-Related Sources PM2.5 Emissions")
dev.off()