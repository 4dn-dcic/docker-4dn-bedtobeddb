#!/bin/bash

# Aggregates a Bed file to a format compatible with higlass (beddb)

INPUT=$1
ASSEMBLY=$2

clodius aggregate bedfile \
    --assembly $ASSEMBLY \
    $INPUT
