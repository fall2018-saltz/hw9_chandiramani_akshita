
library(jsonlite)
JsonData<-fromJSON("hotelSurveyBarriot.json")
clean_data <- data.frame(JsonData)

str(clean_data)
