# Exploratory analysis
# Playing around with data to figure out pivot points
#
# Jon V

#install.packages("quantmod")
#require("quantmod")

cot.volatility <- function(csv_file="~/Sources/COT/all_data.csv", limit=300) {
  data <- read.csv(csv_file, sep=";",header = T)
  rawData <- tail(data, limit)
  Date <- as.Date(rawData$date, '%m/%d/%Y')
  volatility_long <- data.frame(Date, Delt(rawData$com_long, rawData$com_long, k=1)*100)
  volatility_short <- data.frame(Date, Delt(rawData$com_short, rawData$com_short, k=1)*100)
  
  Date <- as.Date(rawData$date, format="%m/%d/%Y")
  Vol <- volatility_long$Delt.1.arithmetic -volatility_short$Delt.1.arithmetic
  rawData$Vol <- Vol
  result <- data.frame(Date, Vol) 
  
  return(list("Vol"=result, "rawData"=rawData))
  
  #latest$volatility_long_100 <- volatility_long$Delt.1.arithmetic * 100
  #latest$volatility_short_100 <- volatility_short$Delt.1.arithmetic * 100
  
  #latest$volatility_long <- volatility_long$Delt.1.arithmetic
  #latest$volatility_short <- volatility_short$Delt.1.arithmetic
  
  #plot(volatility_long[abs(volatility_long$Delt.1.arithmetic) > 0.1,], type="o",col="blue")
  #volatility = data.frame(latest$volatility_long, latest$volatility_short)
  #barplot(as.matrix(t(volatility)), beside = T, col=c("dark green","red"))
  
  #volatility_long[abs(volatility_long$Delt.1.arithmetic) > 0.1,]
  #volatility_short[abs(volatility_short$Delt.1.arithmetic) > 0.1,]

}
  


