
library(jsonlite)
JsonData<-fromJSON("hotelSurveyBarriot.json")
clean_data <- data.frame(JsonData)

str(clean_data)

clean_data$CustSatBuckets <- replicate(length(clean_data$overallCustSat), "Average")
clean_data$CustSatBuckets[clean_data$overallCustSat > 7] <- "High"
clean_data$CustSatBuckets[clean_data$overallCustSat < 7] <- "Low"

