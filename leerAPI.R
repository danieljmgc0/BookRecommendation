library(httr)
library(jsonlite)

for(i in BookRecommendation$ISBN){
  response <- GET(paste0("https://www.googleapis.com/books/v1/volumes?q=isbn:",i))
  status_code(response) # comprobar si no dio error
  data_json <- content(response, "text")
  data_parsed <- fromJSON(data_json)

  print(data_parsed$item$volumeInfo$publishedDate) # se accede a los datos mediante una concatenación de $
  # (se pueden revisar las categorías de datos en RStudio visualizando la variable)
}