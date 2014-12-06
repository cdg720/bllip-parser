#!/bin/bash

if [ "$#" -ne 2 ];
then 
    echo "usage: train.sh MODEL_DIR TRAIN_DATA"
    echo "e.g.: ./train.sh /home/dc65/research/parsing/models/WSJ/ /pro/dpg/dc65/data/WSJ/02-21.mrg"
    exit
fi

MODEL_DIR=$1
if [ ! -d  $MODEL_DIR ]; then
    mkdir $MODEL_DIR
fi

TRAIN=$2

BLLIP=/home/dc65/research/parsing/bllip-parser
DEV=/pro/dpg/dc65/data/WSJ/dev.mrg

cp -a $BLLIP/first-stage/DATA/EN/ $MODEL_DIR
mv $MODEL_DIR/EN/ $MODEL_DIR/parser/

$BLLIP/first-stage/TRAIN/trainParser $MODEL_DIR/parser/ "$TRAIN" $DEV > $MODEL_DIR/out2.txt 2> $MODEL_DIR/err2.txt
