# Regresión para predecir
install.packages("MASS")
library(caret)
library(MASS)

points = read.csv("data/cleanPoints.csv")

row.names(points) = points$X
points$X = NULL

# training
t.id = createDataPartition(points$position, p = 0.7, list =  F)

#Eliminamos el variables que no ocupamos
model = lm(position ~., data = points[t.id, -c(1,2)])
print(model)
summary(model)
boxplot(model$residuals)

sqrt(mean((model$fitted.values - points[t.id, ]$position)^2))

#predecimos
pred = predict(model, points[-t.id, -c(1,2)])
rm = RMSE(pred, points[-t.id,]$position)
print(rm)

#
par(mfrow=c(2,2))
plot(model)



