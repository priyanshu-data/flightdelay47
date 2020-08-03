d<-read.csv(choose.files())
View(d)
d<-d[,-c(24:31)]
d$YEAR<-NULL
d$DAY_OF_WEEK<-NULL
d<-d[,-c(11:21)]
d$DESTINATION_AIRPORT<-NULL
d$AIRLINE<-as.numeric(d$AIRLINE)
d$TAIL_NUMBER<-as.numeric(d$TAIL_NUMBER)
d$ORIGIN_AIRPORT<-as.numeric(d$ORIGIN_AIRPORT)
sum(is.na(d))
d<-na.omit(d)
library(DataExplorer)
plot_correlation(d)
plot_str(d)

boxplot(d$MONTH)
boxplot(d$DAY)
boxplot(d$AIRLINE)
discard<-d
boxplot(d$FLIGHT_NUMBER)
outliers2 <- boxplot(discard$FLIGHT_NUMBER, plot = FALSE)$out
d[d$FLIGHT_NUMBER %in% outliers2, "FLIGHT_NUMBER"] = NA
d<-na.omit(d)

boxplot(d$TAIL_NUMBER)
boxplot(d$ORIGIN_AIRPORT)
outliers3<-boxplot(discard$ORIGIN_AIRPORT,plot = FALSE)$out
d[d$ORIGIN_AIRPORT %in% outliers3, "ORIGIN_AIRPORT"] = NA
d<-na.omit(d)

boxplot(d$SCHEDULED_DEPARTURE)
boxplot(d$DEPARTURE_TIME)
boxplot(d$DEPARTURE_DELAY)
outliers4<-boxplot(discard$DEPARTURE_DELAY,plot = FALSE)$out
d[d$DEPARTURE_DELAY %in% outliers4, "DEPARTURE_DELAY"] = NA
d<-na.omit(d)


write.csv(d,"plane1.csv")
