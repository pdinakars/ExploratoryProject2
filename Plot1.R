NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

DF1<-aggregate(NEI$Emissions,by=list(year=NEI$year),FUN=sum)
plot(DF1$year,DF1$x,xlab="Year",ylab="Emissions",pch=20,main="Variations in Emission from 99 to 08",type="l")
dev.copy(png,'rplot1.png')
dev.off()