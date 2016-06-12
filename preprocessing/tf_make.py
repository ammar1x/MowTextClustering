
vocabulary = {}
with open("vocabulary",'r') as vocabulary_file:
    for line in vocabulary_file:
       (val, key) = line.split(':')
       vocabulary[key[0:-1]] = int(val)
       #vocabulary[key[0:-2]] = int(val)

full_corpora_tf = open('full_corpora_tf', 'w')
full_corpora_tf.truncate(0)

i=0
vocabulary_size=len(vocabulary)
print("Vocabulary size:" + str(vocabulary_size))
#print(vocabulary)
with open("full_corpora_categorized_stemmed",'r') as full_corpora_categorized_stemmed_file:
    for line in full_corpora_categorized_stemmed_file:
        #print(i)
        i = i + 1
        category = line[0:2]
        stemmed_words = line[2:]
        tf_values=  [0] * vocabulary_size
        #tf_values = [1] * vocabulary_size
        for word in stemmed_words.split():
            if word in vocabulary:
                tf_values[vocabulary[word]] += 1
        full_corpora_tf_line = str(category) + " " + " ".join(map(str,tf_values)) + '\n'
        full_corpora_tf.write(full_corpora_tf_line)
