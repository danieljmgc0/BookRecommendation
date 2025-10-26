# Limpieza de datos

anio <- substr(main_data_enriched$publishedDate, 1, 4) #cortar fecha para que sólo sean los años (4 primeros caracteres)
main_data_enriched_catanio <- main_data_enriched # crear copia
main_data_enriched_catanio$publishedDate <- anio # sustituir año en copia
main_data_enriched_catanio <- main_data_enriched_catanio[!is.na(main_data_enriched_catanio$publishedDate), ] # quitar valores vacíos
main_data_enriched_catanio <- main_data_enriched_catanio[!is.na(main_data_enriched_catanio$Category), ] # quitar valores vacíos
main_data_enriched_catanio <- main_data_enriched_catanio[!is.na(main_data_enriched_catanio$categories), ] # quitar valores vacíos
main_data_enriched_catanio$ISBN <- as.character(main_data_enriched_catanio$ISBN) # transformar ISBNs a char

library("doBy")
table(main_data_enriched_catanio$pageCount, main_data_enriched_catanio$Category)
library(ggplot2)

ggplot(main_data_enriched_catanio, aes(x = publishedDate, fill = Category)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribución de categorías por año")
