---
title: BEEFY Light Client Implementer's Guide
---

## Introduction

BEEFY is an additional consensus layer designed for Light Clients to follow Polkadot's finality. In this guide we take a closer look at the light-client side implementation details. For details of the BEEFY finality process and host-side protocol, please refer to the [BEEFY Specifications](https://spec.polkadot.network/sect-finality#sect-grandpa-beefy). 
The BEEFY justifications (signed commitments or signed commitment witnesses) are circulated /gossiped similar to GRANDPA justifications on a dedicated network substream. The light client can directly listen to the [substream](https://spec.polkadot.network/chap-networking#sect-protocols-substreams) or rely upon a [relayer](https://spec.polkadot.network/sect-finality#defn-beefy-relayer) to fetch the latest finality  via the [payload](https://spec.polkadot.network/sect-finality#defn-beefy-payload) (the MMR root  of the chain containing the latest BEEFY finalized block). 


## V1: Random Sampling using ECDSA-BEEFY Signatures
Random Sampling is an interactive protocol between the light client and a relayer with probabilistic security guarantees for the authenticity and finality of the payload. For the random sampling based light clients, the security guarantees of the approach are parametrized by the number of BEEFY signatures checked by the light client.





## V2: SNARKs using BLS-BEEFY Signatures