library(RWeka)
library(openxlsx)
Skin = read.xlsx("Skin_NonSkin.xlsx")

set.seed(50464)
g = runif(nrow(Skin))
Skin_Random = Skin[order(g),] 

Skin_Random = Skin_Random[sample(nrow(Skin_Random), 400), ] 
View(Skin_Random)
Skin_Random$AKZ = as.factor(Skin_Random$AKZ)
m1 <- J48(AKZ~., data=Skin_Random)
dev.off()
m1

plot(m1)
summary(m1)


predictions <- predict(m1, Skin_Random[,1:3])

table(predictions, Skin_Random$AKZ)

