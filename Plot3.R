pmbalt<-subset(MDF,MDF$fips=="24510")
ggplot(pmbalt,aes(x=factor(year),y=Emissions,fill=type))+geom_col(position="dodge")+ggtitle("Plot of Baltimore Emissions based on Emission Type for Year 1999-2008")
dev.copy(png,'plot3.png')
dev.off()
