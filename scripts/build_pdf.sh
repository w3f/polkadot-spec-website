#!/bin/bash

website="http://localhost:3000/"

toExcludeSpec=(
  "implementation-guide"
  "implementation-guide/first"
  "implementation-guide/second"
)

toExcludeCommon=(
  "id-cryptography-encoding"
  "chap-host-api"
  "chap-runtime-api"
)

for i in "${!toExcludeSpec[@]}"; do
  toExcludeSpec[$i]="$website${toExcludeSpec[$i]}"
done

for i in "${!toExcludeCommon[@]}"; do
  toExcludeCommon[$i]="$website${toExcludeCommon[$i]}"
done

# join all the element of the two arrays with a ,
# example: http://localhost:3000/implementation-guide,http://localhost:3000/implementation-guide/first
toExcludeSpec=$(printf ",%s" "${toExcludeSpec[@]}")
toExcludeSpec=${toExcludeSpec:1}
toExcludeCommon=$(printf ",%s" "${toExcludeCommon[@]}")
toExcludeCommon=${toExcludeCommon:1}

# generate pdf of Specification part
npx docs-to-pdf \
  --initialDocURLs="http://localhost:3000/specification" \
  --contentSelector="article" \
  --paginationSelector="a.pagination-nav__link.pagination-nav__link--next" \
  --excludeSelectors=".margin-vert--xl a,[class^='tocCollapsible'],.breadcrumbs,.theme-edit-this-page" \
  --coverImage="http://localhost:3000/img/Polkadot_Logo_Horizontal_Pink-Black.svg" \
  --coverTitle="Polkadot Protocol Spec" \
  --excludeURLs="${toExcludeSpec},${toExcludeCommon}" \

mv docs-to-pdf.pdf static/Specification.pdf

# generate pdf of Implementation Guide part
npx docs-to-pdf \
  --initialDocURLs="http://localhost:3000/implementation-guide" \
  --contentSelector="article" \
  --paginationSelector="a.pagination-nav__link.pagination-nav__link--next" \
  --excludeSelectors=".margin-vert--xl a,[class^='tocCollapsible'],.breadcrumbs,.theme-edit-this-page" \
  --coverImage="http://localhost:3000/img/Polkadot_Logo_Horizontal_Pink-Black.svg" \
  --coverTitle="Implementation Guide" \
  --excludeURLs="${toExcludeCommon}" \

mv docs-to-pdf.pdf static/Implementation_Guide.pdf
