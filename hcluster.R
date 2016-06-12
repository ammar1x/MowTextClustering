

dtm = dtm <- DocumentTermMatrix(docs,
                                control = list(weighting = function(x) weightTfIdf(x, normalize = TRUE),
                                               stopwords = FALSE))
dtm <- removeSparseTerms(dtm, sparse=0.98)


dtm1 = as.matrix(dtm)
print("calculating distance matrix")
d1 = dist(dtm1, method="cosine")
print("grouping with hcluster")
fit <- hclust(d1, method="ward")   
plot.new()
plot(fit, hang=-1)
groups <- cutree(fit, k=5)   # "k=" defines the number of clusters you are using   
rect.hclust(fit, k=5, border="red") # draw dendogram with red borders around the 5 clusters   
