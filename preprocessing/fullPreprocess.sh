#!/bin/bash

#Comment this line after generating full_corpora_categorized_stemmed file
#python3.5 tokenizeCleanAndStemCorpora.py

python3.5 buildVocabulary.py
python3.5 tf_make.py
./prepareTrainingAndTestSets.sh 200 0
