NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
MDF <- merge(NEI,SCC)

pmbalt<-subset(MDF,MDF$fips=="24510")
DF2<-aggregate(pmbalt$Emissions,by=list(year=pmbalt$year),FUN=sum)
plot(DF2$year,DF2$x,xlab="Year",ylab="Emissions",pch=20,main="Variations in Baltimore Emission from 99 to 08")
dev.copy(png,'rplot2.png')
dev.off()