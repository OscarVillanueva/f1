#Librerias
install.packages("naniar")
library(naniar)

# Leer los datos
points = read.csv("./data/position.csv", stringsAsFactors = FALSE)

row.names(points) = points$X
points$X = NULL
colnames(points)[8] = "maxSpeed"

# Buscamos los \\N
points = points %>% replace_with_na(replace = list(position = "\\N"))
points = points %>% replace_with_na(replace = list(milliseconds = "\\N"))
points = points %>% replace_with_na(replace = list(rank = "\\N"))
points = points %>% replace_with_na(replace = list(maxSpeed = "\\N"))

points$position = sapply(points$position, function(x) as.numeric(x))
points$milliseconds = sapply(points$milliseconds, function(x) as.numeric(x))
points$rank = sapply(points$rank, function(x) as.numeric(x))
points$maxSpeed = sapply(points$maxSpeed, function(x) as.numeric(x))

# Remplazar los NA
# points$millis = ifelse(is.na(points$milliseconds), mean(points$milliseconds, na.rm = TRUE), points$milliseconds)
# points$rank.mean = ifelse(is.na(points$rank), mean(points$rank, na.rm = TRUE), points$rank)
# points$maxSpeed.mean = ifelse(is.na(points$maxSpeed), mean(points$maxSpeed, na.rm = TRUE), points$maxSpeed)

omitted = na.omit(points)

# Guardamos
write.csv(omitted, "./data/cleanPoints.csv")
