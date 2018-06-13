library(C50)
library(rattle)
library(rpart)
library(RColorBrewer)


Suicides_DaatN = read.csv("Suicides_in_India_2001-2012.csv")

summary(Suicides_DataN)
str(Suicides_DataN)
head(Suicides_DataN)
tail(Suicides_DataN)
View(Suicides_DataN)

set.seed(50464)
g = runif(nrow(Suicides_DataN))
Suicides_Data = Suicides_DataN[order(g),] 


#m1 <- C5.0(Type~., data=Suicides_Data, trials=10)

m1 <- C5.0(Suicides_Data[1:500,-4],Suicides_Data[1:500,4])
#c5.0(predictors, target)

t = C5imp(m1)
plot(t)
m1
print(m1)
plot(m1)
summary(m1)
fancyRpartPlot(m1)

#predictions <- predict(m1, Suicides_Data)
predictions <- predict(m1, Suicides_Data[501:1500,])
summary(predictions)
fancyRpartPlot(predictions)

plot(predictions)
table(predictions, Suicides_Data$Type)
table(Suicides_Data[501:1500,4],predicted=predictions)
