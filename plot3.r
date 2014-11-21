NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- NEI[NEI$fips == "24510",]
Balt$type<-as.factor(Balt$type)
Balttotals <- aggregate(Emissions ~ year+type, data=Balt, sum)

library (ggplot2)
png(filename="plot3.png", width = 480, height = 480)
# qplot(year,Emissions,data=Balttotals,facets=.~type,geom="line")
qplot(year,
      Emissions,
      data=Balttotals,
      color=type,
      geom="line",
      main = "Baltimore PM2.5 Emissions")
dev.off()