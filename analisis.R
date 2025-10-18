book_recomendation <- read.csv(file = "data/BookRecommendation_Dataset.csv", sep=',')

book_ratings <- read.csv(file = "data/UserRatings.csv", sep = ";", quote = "", row.names = NULL, stringsAsFactors = FALSE)

main_dataset <- read.csv(file = "data/main_dataset.csv", sep = ',')

books_dataclean <- read.csv("data/Books_Data_Clean.csv", sep = ',')

little_book_dataset <- read.csv("data/Little_Books_Dataset.csv", sep = ',')
