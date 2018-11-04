
library("arules")
library("arulesViz")
hotelSurveyX <- as(hotelSurvey,"transactions")
inspect(hotelSurveyX)
itemFrequency(hotelSurveyX)
itemFrequencyPlot(hotelSurveyX) 
