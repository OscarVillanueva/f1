# Regresión para predecir
points = read.csv("data/cleanPoints.csv")

row.names(points) = points$X
points$X = NULL

