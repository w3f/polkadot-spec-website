#!/bin/bash

dirs=(
  "algorithms"
  "docs"
  "kaitai_structures"
)
files=(
  "bibliography.bib"
)

for dir in "${dirs[@]}"
do
  if [ -d "src/$dir" ]; then
    rm -r "src/$dir"
  fi
done

for file in "${files[@]}"
do
  if [ -f "src/$file" ]; then
    rm "src/$file"
  fi
done
