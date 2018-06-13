library(rpart)
library(openxlsx)

skin = read.xlsx("Skin_NonSkin.xlsx")
View(skin)

na.skin = skin
colnames(na.skin) = c("R", "G", "B", "AKZ")

fir = rpart(AKZ ~ R + G + B,data = na.pim,
            parms = list(split="gini"),
            control = rpart.control(minsplit = 10, cp = 0.002))
plot(fir, uniform=TRUE, main = "Complete / Pruned Tree - Entropy")
text(fir, use.n=TRUE, all=TRUE, cex=0.9)
printcp(fir)

pfit = prune(fir, cp=fir$cptable[which.min(fir$cptable[,"xerror"]), "CP"])
plot(pfit, uniform=TRUE, main = " Tree - Entropy")
text(pfit, use.n=TRUE, all=TRUE, cex=0.9)
summary(pfit)
library(Hmisc)

describe(fir)

fir
