import re
import os
import nltk
from nltk.stem import *
from nltk.corpus import stopwords

corpora_directories = [
    "13_cat_physical_sciences_and_engineering_subcat_computer_science_txt",
 #   "19_high_energy_particles_txt",
 #   "22_cat_life_sciences_subcat_biochemistry_genetic_and_molecular_biology_txt",
 #   "31_cat_health_sciences_subcat_medicine_and_dentistry_txt",
 #   "44_cat_social_sciences_and_humanities_subcat_economics_econometrics_and_finance_txt"
]

regex1 = re.compile(r"\b^[a-z][a-z\-\']+[a-z\']$\b",
                    re.I | re.M)  # multiline ignorecase regex. At least 3 character word

full_corpora_categorized_stemmed = open('full_corpora_categorized_stemmed1', 'w')
full_corpora_categorized_stemmed.truncate(0)

stemmer = SnowballStemmer("english")


def removeNonWords(words):
    return [word for word in words if regex1.search(word)]


def removeStopWords(words):
    return [word for word in words if word not in stopwords.words('english')]


def stemmWords(words):
    return [stemmer.stem(word) for word in words]


for directory in corpora_directories:
    category = directory[0:2]
    for article in sorted(os.listdir('./' + directory))[:2]:
        coreWords = []

        with open('./' + directory + '/' + article) as fileHandler:
            tokens = nltk.word_tokenize(fileHandler.read().lower())
            words = removeNonWords(tokens)
            filteredWords = removeStopWords(words)
            coreWords = stemmWords(filteredWords)

        full_corpora_categorized_stemmed.write(' ' + str(category))
        full_corpora_categorized_stemmed.write(" ".join(coreWords))
        full_corpora_categorized_stemmed.write("\n")
