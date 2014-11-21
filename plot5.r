NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- NEI[NEI$fips == "24510",]
vehicleIndex <- grep ("Vehicle", SCC$EI.Sector)
vehicle <- SCC[vehicleIndex,] # get rows for vehicle
BaltVehicle <- merge(Balt,vehicle,by.x="SCC",by.y="SCC")
BaltVehicleTotals <- aggregate(Emissions ~ year, data=BaltVehicle, sum)

library (ggplot2)
png(filename="plot5.png", width = 480, height = 480)
qplot(year,Emissions,data=BaltVehicleTotals,
      geom="line",
      main = "Baltimore Motor Vehicle Sources PM2.5 Emissions")
dev.off()