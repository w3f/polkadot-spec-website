#!/bin/bash

npx docs-to-pdf \
  --initialDocURLs="https://spec.polkadot.network/id-polkadot-protocol" \
  --contentSelector="article" \
  --paginationSelector="a.pagination-nav__link.pagination-nav__link--next" \
  --excludeSelectors=".margin-vert--xl a,[class^='tocCollapsible'],.breadcrumbs,.theme-edit-this-page" \
  --coverImage="https://spec.polkadot.network/img/Polkadot_Logo_Horizontal_Pink-Black.svg" \
  --coverTitle="Polkadot Protocol Spec"

mv docs-to-pdf.pdf static/Polkadot_Protocol_Spec.pdf
