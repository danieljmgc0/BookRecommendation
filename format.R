print(summaryBy(Price ~ Format,main_data_enriched[!is.na(main_data_enriched$Price), ], FUN=mean), n = 32)
dfSummaryFormat <- summaryBy(Price ~ Format,main_data_enriched[!is.na(main_data_enriched$Price) & !is.na(main_data_enriched$Format), ], FUN=mean)
ggplot(dfSummaryFormat, aes(x = Price.mean, y = reorder(Format, Price.mean))) + geom_col(fill = "skyblue")
