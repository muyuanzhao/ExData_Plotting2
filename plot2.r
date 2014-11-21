NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- NEI[NEI$fips == "24510",]
Balttotals <- aggregate(Emissions ~ year, data=Balt, sum)

png(filename="plot2.png", width = 480, height = 480)
plot(Balttotals$year,
     Balttotals$Emissions, 
     type="l", 
     main = "Baltimore PM2.5 Total Emissions",
     ylab = "Total Emissions", 
     xlab = "Year")
dev.off()