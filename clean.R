
library(jsonlite)
JsonData<-fromJSON("hotelSurveyBarriot.json")
clean_data <- data.frame(JsonData)

clean_data$CustSatBuckets <- replicate(length(clean_data$overallCustSat), "Average")
clean_data$CustSatBuckets[clean_data$overallCustSat > 7] <- "High"
clean_data$CustSatBuckets[clean_data$overallCustSat < 7] <- "Low"

clean_data$checkinSatBuckets <- replicate(length(clean_data$checkinSat), "Average")
clean_data$checkinSatBuckets[clean_data$checkinSat > 7] <- "High"
clean_data$checkinSatBuckets[clean_data$checkinSat < 7] <- "Low"

clean_data$hotelCleanBuckets <- replicate(length(clean_data$hotelClean), "Average")
clean_data$hotelCleanBuckets[clean_data$hotelClean > 7] <- "High"
clean_data$hotelCleanBuckets[clean_data$hotelClean < 7] <- "Low"

clean_data$hotelFriendlyBuckets <- replicate(length(clean_data$hotelFriendly), "Average")
clean_data$hotelFriendlyBuckets[clean_data$hotelFriendly > 7] <- "High"
clean_data$hotelFriendlyBuckets[clean_data$hotelFriendly < 7] <- "Low"

q <- quantile(clean_data$hotelSize, c(0.4, 0.6))
clean_data$hotelSizeBuckets <- replicate(length(clean_data$hotelSize), "Average")
clean_data$hotelSizeBuckets[clean_data$hotelSize <= q[1]] <- "Low"
clean_data$hotelSizeBuckets[clean_data$hotelSize > q[2]] <- "High"

q <- quantile(clean_data$hotelState, c(0.4, 0.6))
clean_data$hotelStateBuckets <- replicate(length(clean_data$hotelState), "Average")
clean_data$hotelStateBuckets[clean_data$hotelState <= q[1]] <- "Low"
clean_data$hotelStateBuckets[clean_data$hotelState > q[2]] <- "High"


