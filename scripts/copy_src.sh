#!/bin/bash

dirs=(
  "algorithms"
  "docs"
  "kaitai_structures"
  "implementation-guide"
)
files=(
  "bibliography.bib"
)

# Delete the previous dirs / files
# For some reason, overwriting doesn't always work

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

# Copy the new dirs / files

for dir in "${dirs[@]}"
do
  if [ -d "../$dir" ]; then
    cp -r "../$dir" "src/$dir"
  fi
done

for file in "${files[@]}"
do
  if [ -f "../$file" ]; then
    cp "../$file" "src/$file"
  fi
done