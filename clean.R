
library(jsonlite)
JsonData<-fromJSON("hotelSurveyBarriot.json")
clean_data <- data.frame(JsonData)

clean_data$CustSatBuckets <- replicate(length(clean_data$overallCustSat), "Average")
clean_data$CustSatBuckets[clean_data$overallCustSat > 7] <- "High"
clean_data$CustSatBuckets[clean_data$overallCustSat < 7] <- "Low"

clean_data$hotelSizeBuckets <- replicate(length(clean_data$hotelSize), "Average")
clean_data$hotelSizeBuckets[clean_data$hotelSize > 7] <- "High"
clean_data$hotelSizeBuckets[clean_data$hotelSize < 7] <- "Low"

str(clean_data)

