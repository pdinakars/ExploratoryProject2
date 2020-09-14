if(dir.exists("./exdata_data_NEI_data")){
  setwd("exdata_data_NEI_data")
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  MDF <- merge(NEI,SCC)
  EmD1999<-subset(MDF,MDF$year=="1999")
  EmD2002<-subset(MDF,MDF$year=="2002")
  EmD2005<-subset(MDF,MDF$year=="2005")
  EmD2008<-subset(MDF,MDF$year=="2008")
  
  
  pm99<-EmD1999$Emissions
  summary(pm99)
  pm08<-EmD2008$Emissions
  summary(pm08)
  
  
  #boxplot(log10(pm99),log10(pm08))
  # dev.copy(png,'plot0.png')
  # dev.off()
 
  DF1<-aggregate(NEI$Emissions,by=list(year=NEI$year),FUN=sum)
  plot(DF1$year,DF1$x,xlab="Year",ylab="Emissions",pch=20,main="Variations in Emission from 99 to 08",type="l")
  dev.copy(png,'plot1.png')
  dev.off()
  
#  MDF$year<-as.Date(as.character(MDF$year),"%Y")
  
  pmbalt<-subset(MDF,MDF$fips=="24510")
  DF2<-aggregate(pmbalt$Emissions,by=list(year=pmbalt$year),FUN=sum)
  plot(DF2$year,DF2$x,xlab="Year",ylab="Emissions",pch=20,main="Variations in Baltimore Emission from 99 to 08")
  dev.copy(png,'plot2.png')
  dev.off()
  
#  ggplot(pmbalt)+geom_point(aes(x=year,y=Emissions,colour=factor(type)))
  ggplot(pmbalt,aes(x=factor(year),y=Emissions,fill=type))+geom_col(position="dodge")+ggtitle("Plot of Baltimore Emissions based on Emission Type for Year 1999-2008")
  dev.copy(png,'plot3.png')
  dev.off()
  
  coalRel<-MDF[grep("coal",MDF$Short.Name),]
#  ggplot(coalRel)+geom_point(aes(x=year,y=Emissions,colour=factor(type)))
  ggplot(coalRel,aes(x=factor(year),y=Emissions,fill=type))+geom_col(position="dodge")+ggtitle("Coal usage across US from 1999-2008")
  dev.copy(png,'plot4.png')
  dev.off()
  
  pmbaltOnRd<-pmbalt[grep("Onroad",pmbalt$Data.Category),]
  DF4<-aggregate(pmbaltOnRd$Emissions,by=list(year=pmbaltOnRd$year),FUN=sum)
  plot(DF4$year,DF4$x,xlab="Year",ylab="Emissions",pch=20,main="Baltimore OnRoad Emissions ")
  
#  plot(pmbaltOnRd$year,pmbaltOnRd$Emissions,main="Emissions from motor vehicle sources in Balimore")
  dev.copy(png,'plot5.png')
  dev.off()
  
  pmLA<-subset(MDF,MDF$fips=="06037")
  pmLAOnRd<-pmLA[grep("Onroad",pmLA$Data.Category),]
#  rng<-range(pmbaltOnRd$Emissions,pmLAOnRd$Emissions,na.rm=T)
  DF3<-aggregate(pmLAOnRd$Emissions,by=list(year=pmLAOnRd$year),FUN=sum)
  rng<-range(DF4$x,DF3$x,na.rm=T)
  
  par(mfrow=c(1,2),mar=c(4,4,2,1))
  mtext("Baltimore Vs Los Angeles", outer=TRUE, cex=2)
  plot(DF4$year,DF4$x,xlab="Year",ylab="Emissions-Baltimore",pch=20,main="Baltimore",ylim=rng)
  abline(h=median(DF4$x,na.rm=T))
#  plot(pmbaltOnRd$year,pmbaltOnRd$Emissions,pch=20,ylim=rng,main="Comparison between Baltimore and Los Angeles")
#  abline(h=median(pmbaltOnRd$Emissions,na.rm=T))
  plot(DF3$year,DF3$x,xlab="Year",ylab="Emissions-LA",pch=20,ylim=rng,main="Los Angeles")
  abline(h=median(DF3$x,na.rm=T))
#  plot(pmLAOnRd$year,pmLAOnRd$Emissions,pch=20,ylim=rng)
#  abline(h=median(pmLAOnRd$Emissions,na.rm=T))
  dev.copy(png,'plot6.png')
  dev.off()
}
  
  
  