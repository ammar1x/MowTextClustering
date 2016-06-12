#!/bin/bash

#INPUT_FILE="full_corpora_TfIdf.txt"
INPUT_FILE="full_corpora_tf"
#INPUT_FILE="full_corpora_categorized_stemmed"

TRAINING_SUBSET_N=$1
if [ -z "$TRAINING_SUBSET_N" ]; then
    echo "Usage: prepareTrainingAndTestSets.sh <number of articles in training set from any category> (OPTIONAL)[number of articles in test set from any category]"
    exit 1
fi

TEST_SUBSET_CONST_N=$2
if [ -z "$TEST_SUBSET_CONST_N" ]; then 
    OUTPUT_FILE_TRAINING_DATA="training_data_$TRAINING_SUBSET_N"
    OUTPUT_FILE_TEST_DATA="test_data_$TRAINING_SUBSET_N"
else
    OUTPUT_FILE_TRAINING_DATA=training_data_"$TRAINING_SUBSET_N"_"$TEST_SUBSET_CONST_N"
    OUTPUT_FILE_TEST_DATA=test_data_"$TRAINING_SUBSET_N"_"$TEST_SUBSET_CONST_N"
fi

CATEGORIES="13
19
22
31
44"

rm $OUTPUT_FILE_TRAINING_DATA
rm $OUTPUT_FILE_TEST_DATA

for category in `echo "$CATEGORIES"`; do
    echo "Processing category $category"
    ALL_ARTICLES_IN_CATEGORY=`grep "^$category .*" $INPUT_FILE | wc | awk {'print $1'}`
    if [ -z "$TEST_SUBSET_CONST_N" ]; then 
        TEST_SUBSET_N=$(( $ALL_ARTICLES_IN_CATEGORY - $TRAINING_SUBSET_N ))
    else
        TEST_SUBSET_N=$TEST_SUBSET_CONST_N
    fi
    grep "^$category .*" $INPUT_FILE | sort  > tmpfile1
    head -$TRAINING_SUBSET_N tmpfile1 >> $OUTPUT_FILE_TRAINING_DATA
    tail -$TEST_SUBSET_N tmpfile1 >> $OUTPUT_FILE_TEST_DATA
done

rm tmpfile1
