NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totals <- aggregate(Emissions ~ year, data=NEI, sum)

png(filename="plot1.png", width = 480, height = 480)
plot(totals$year,
     totals$Emissions, 
     type="l", 
     main = "US PM2.5 Total Emissions",
     ylab = "Total Emissions", 
     xlab = "Year")
dev.off()