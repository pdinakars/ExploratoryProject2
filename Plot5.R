pmbaltOnRd<-pmbalt[grep("Onroad",pmbalt$Data.Category),]
DF4<-aggregate(pmbaltOnRd$Emissions,by=list(year=pmbaltOnRd$year),FUN=sum)
plot(DF4$year,DF4$x,xlab="Year",ylab="Emissions",pch=20,main="Baltimore OnRoad Emissions ")
dev.copy(png,'plot5.png')
dev.off()