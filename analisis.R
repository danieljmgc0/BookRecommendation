library(dplyr)

book_recomendation <- read.csv(file = "data/BookRecommendation_Dataset.csv", sep=',')

book_ratings <- read.csv(file = "data/Book_DatasetELIMINAR.csv", sep = ";", quote = "", row.names = NULL, stringsAsFactors = FALSE)

main_dataset <- read.csv(file = "data/main_dataset.csv", sep = ',')

books_dataclean <- read.csv("data/Books_Data_Clean.csv", sep = ',')

little_book_dataset <- read.csv("data/Little_Books_Dataset.csv", sep = ',')


bx_boos_data <- read.csv("data/BX_Books.csv", sep = ";", quote = "", row.names = NULL, stringsAsFactors = FALSE)
bx_book_ratings_data <- read.csv("data/BX-Book-Ratings.csv", sep = ";", quote = "", row.names = NULL, stringsAsFactors = FALSE)
bx_data <- merged_books <- inner_join(bx_boos_data, bx_book_ratings_data, by = c("X.ISBN."))

bx_data <- main_dataset %>% rename(X.Book.Author. = name)

summary(book_recomendation)

summary(book_ratings)

summary(main_dataset)

summary(books_dataclean)

summary(little_book_dataset)



# Renombrar columnas en book_ratings
book_ratings <- book_ratings %>%
  rename(ISBN = X.ISBN., Book.Title = X.Book.Title.)

# Renombrar columnas en main_dataset
main_dataset <- main_dataset %>%
  rename(Book.Title = name, ISBN = isbn)

# Renombrar columnas en books_dataclean
books_dataclean <- books_dataclean %>%
  rename(Book.Title = Book.Name)

# Renombrar columnas en little_book_dataset
little_book_dataset <- little_book_dataset %>%
  rename(Book.Title = title)

# Unir book_recomendation y book_ratings por ISBN y Book.Title
merged_books <- inner_join(book_recomendation, book_ratings, by = c("ISBN"))



# Unir el resultado con main_dataset por ISBN y Book.Title
main_dataset <- main_dataset %>% mutate(ISBN = as.character(ISBN))
book_ratings <- book_ratings %>%  mutate(ISBN = as.character(ISBN))
merged_books <- inner_join(book_ratings, main_dataset, by = c("ISBN"))





isbn <- 9788441440098


url <- paste0("https://www.googleapis.com/books/v1/volumes?q=isbn:", isbn)
res <- tryCatch({
  httr::GET(url)
}, error = function(e) return(NULL))
# Parsear JSON
data <- jsonlite::fromJSON(content(res, as = "text", encoding = "UTF-8"))


                           