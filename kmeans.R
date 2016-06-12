

# grouping using k-means

#normalize
normalize = function (m) {
  m = as.matrix(m)
  m = sweep(m, 2, colSums(m), FUN="/")
  m = scale(m, center=FALSE, scale=colSums(m))
  return(m)
}


dtm = dtm <- DocumentTermMatrix(docs,
                                control = list(weighting = weightTfIdf, normalize = TRUE,
                                               stopwords = FALSE))
dtm <- removeSparseTerms(dtm, sparse=0.90)

dtm1 = as.matrix(dtm)
print("computing dissimiliarity")
d1 = dist(dtm1, method = "cosine")
print("grouping with k-means")
kfit1 = kmeans(d1, 5)
print("plotting")
clusplot(as.matrix(d1), kfit1$cluster, color=T, shader=T, lables=5, lines = 0)

