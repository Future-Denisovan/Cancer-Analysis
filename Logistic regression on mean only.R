### R setup
rm(list=ls())
cat("\04")
df = read.csv("data.csv")
library("caTools")
library("dplyr")
set.seed(1234)

### Create Trianing and Testing data
split = sample.split(df$diagnosis, SplitRatio = 0.7)
Train = subset(df, split == TRUE)
Test = subset(df, split == FALSE)
1-sum(Test$diagnosis)/nrow(Test)
# baseline model accuracy 62.57%

### Create a logistic regression
df.logReg = glm(diagnosis ~ ., data = Train, family = binomial)
summary(df.logReg)

### Make predictions
prediction = predict(df.logReg, type = "response", newdata = Test)
summary(prediction)

### Check model accuracy
table(Test$diagnosis, prediction > 0.5)
(97+62)/(97+62+10+2)
# model accuracy = 92.98%