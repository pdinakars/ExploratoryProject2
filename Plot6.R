pmLA<-subset(MDF,MDF$fips=="06037")
pmLAOnRd<-pmLA[grep("Onroad",pmLA$Data.Category),]
DF3<-aggregate(pmLAOnRd$Emissions,by=list(year=pmLAOnRd$year),FUN=sum)
rng<-range(DF4$x,DF3$x,na.rm=T)

par(mfrow=c(1,2),mar=c(4,4,2,1))
mtext("Baltimore Vs Los Angeles", outer=TRUE, cex=2)
plot(DF4$year,DF4$x,xlab="Year",ylab="Emissions-Baltimore",pch=20,main="Baltimore",ylim=rng)
abline(h=median(DF4$x,na.rm=T))
plot(DF3$year,DF3$x,xlab="Year",ylab="Emissions-LA",pch=20,ylim=rng,main="Los Angeles")
abline(h=median(DF3$x,na.rm=T))
dev.copy(png,'plot6.png')
dev.off()