


library(tm)
library(proxy)
library(SnowballC)
# load corpus

# po to zeb miec loadowac tylko niewielka liczbe dokumentow uzywamy wzorzec, ktory
# pobiera tylko pliki, ktorych nazwa spelnia wzorzec regularny
pattern="[0-2][0-9]$" # pliki ktore koncza sie na [0-2][0-9]

docs = Corpus(DirSource(directory="./corpus", pattern="[0-2][0-9]$", recursive = TRUE))


#1. preprocesssing

#1.1 remove punctuation
docs = tm_map(docs, content_transformer(removePunctuation))

#1.2 remove numbers
docs = tm_map(docs, content_transformer(removeNumbers))

#1.3 convert to lower case
docs = tm_map(docs, content_transformer(tolower))

#1.4 remove stop words 
docs = tm_map(docs, content_transformer(removeWords), stopwords('english'))

#1.5 stripWhitespace
docs = tm_map(docs, content_transformer(stripWhitespace))


#1.6 - stemming
docs = tm_map(docs, content_transformer(stemDocument))

#1.7 Treat them as text documnt
docs = tm_map(docs, content_transformer(PlainTextDocument))






