coalRel<-MDF[grep("coal",MDF$Short.Name),]
ggplot(coalRel,aes(x=factor(year),y=Emissions,fill=type))+geom_col(position="dodge")+ggtitle("Coal usage across US from 1999-2008")
dev.copy(png,'plot4.png')
dev.off()