# Leemos los datos
clean = read.csv("f1db_csv/results.csv")

# ID's como filas
row.names(clean) = clean$resultId
 
# Borrar columnas
clean$resultId = NULL
clean$raceId = NULL
clean$positionText = NULL
clean$number = NULL
clean$positionOrder = NULL
clean$time = NULL
clean$year = NULL
clean$points = NULL
clean$fastestLap = NULL
clean$fastestLapTime = NULL
clean$statusId = NULL

# Buscar los NA
(is.na(clean$position))


# guardamos el clean
write.csv(clean, "./position.csv")
