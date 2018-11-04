
library(jsonlite)
JsonData<-fromJSON("hotelSurveyBarriot.json")
clean_data <- data.frame(JsonData)

clean_data$CustSatBuckets <- replicate(length(clean_data$overallCustSat), "Average")
clean_data$CustSatBuckets[clean_data$overallCustSat > 7] <- "High"
clean_data$CustSatBuckets[clean_data$overallCustSat < 7] <- "Low"
str(clean_data)

clean_data$checkInSatBuckets <- replicate(length(clean_data$checkInSat), "Average")
clean_data$checkInSatBuckets[clean_data$checkInSat > 7] <- "High"
clean_data$checkInSatBuckets[clean_data$checkInSat < 7] <- "Low"

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

q <- quantile(clean_data$guestAge, c(0.4, 0.6))
clean_data$guestAgeBuckets <- replicate(length(clean_data$guestAge), "Average")
clean_data$guestAgeBuckets[clean_data$guestAge <= q[1]] <- "Low"
clean_data$guestAgeBuckets[clean_data$guestAge > q[2]] <- "High"

q <- quantile(clean_data$lengthOfStay, c(0.4, 0.6))
clean_data$lengthOfStayBuckets <- replicate(length(clean_data$lengthOfStay), "Average")
clean_data$lengthOfStayBuckets[clean_data$lengthOfStay <= q[1]] <- "Low"
clean_data$lengthOfStayBuckets[clean_data$lengthOfStay > q[2]] <- "High"

q <- quantile(clean_data$whenBookedTrip, c(0.4, 0.6))
clean_data$whenBookedTripBuckets <- replicate(length(clean_data$whenBookedTrip), "Average")
clean_data$whenBookedTripBuckets[clean_data$whenBookedTrip <= q[1]] <- "Low"
clean_data$whenBookedTripBuckets[clean_data$whenBookedTrip > q[2]] <- "High"

str(clean_data)


