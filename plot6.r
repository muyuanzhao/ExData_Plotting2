NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- NEI[NEI$fips == "24510",]
LosAngeles <- NEI[NEI$fips == "06037",]

vehicleIndex <- grep ("Vehicle", SCC$EI.Sector)
vehicle <- SCC[vehicleIndex,] # get rows for vehicle

BaltVehicle <- merge(Balt,vehicle,by.x="SCC",by.y="SCC")
BaltVehicleTotals <- aggregate(Emissions ~ year, data=BaltVehicle, sum)

LosAngelesVehicle <- merge(LosAngeles,vehicle,by.x="SCC",by.y="SCC")
LosAngelesVehicleTotals <- aggregate(Emissions ~ year, data=LosAngelesVehicle, sum)

png(filename="plot6.png", width = 480, height = 480)
par(mfrow = c(1, 2))
with(BaltVehicleTotals,
     plot(year,
          Emissions,
          type="l",
          main = "Baltimore"))
with(LosAngelesVehicleTotals,
     plot(year,
          Emissions,
          type="l",
          main = "Los Angeles"))
dev.off()