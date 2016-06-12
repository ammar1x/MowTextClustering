from sklearn.feature_extraction.text import TfidfVectorizer

full_corpora_categorized_stemmed_file = open("full_corpora_categorized_stemmed1",'r')


#tfidfVectorizer = TfidfVectorizer(max_df=0.1, min_df=0.004) #Vocabulary size:11519
tfidfVectorizer = TfidfVectorizer(max_df=0.1, min_df=0.001) #Vocabulary size:35121
tfidf = tfidfVectorizer.fit_transform(full_corpora_categorized_stemmed_file)

vocabulary = {}
for key, val in tfidfVectorizer.vocabulary_.items():
    vocabulary[val] = key
vocabulary = sorted(vocabulary.items())

vocabulary_file = open("vocabulary1",'w')
vocabulary_file.truncate(0)
for entry in vocabulary:
    line = str(entry[0]) + ':' + str(entry[1]) + '\n'
    vocabulary_file.write(line)

print(len(vocabulary))
