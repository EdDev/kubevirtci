#!/usr/bin/env bash

set -e

declare -A IMAGES
IMAGES[gocli]="gocli@sha256:220f55f6b1bcb3975d535948d335bd0e6b6297149a3eba1a4c14cad9ac80f80d"
if [ -z $KUBEVIRTCI_PROVISION_CHECK ]; then
    IMAGES[k8s-fedora-1.17.0]="k8s-fedora-1.17.0@sha256:1949954387016691c5f883c15a1cbab7d418f44ceee5d8fcc48fe85d3369fb38"
    IMAGES[k8s-1.17]="k8s-1.17@sha256:c50f8ea07a009ca24c1c6584447f18186849c3d9503c1ab1b1413669e29debb0"
    IMAGES[k8s-1.16]="k8s-1.16@sha256:dcd14c98361a318801f080ae1d1ee032cd03caf11775a5bf23f6d26dd90ea247"
    IMAGES[k8s-1.15]="k8s-1.15@sha256:c57f4156eac16d2fb02741605215b4901607d4eaacc8c24bb1a04df7d5736ff2"
    IMAGES[k8s-1.14]="k8s-1.14@sha256:63590cd8b4e1fc65b305a4aa2a22754c43ee5fc3ba2bbe2e5bd936dff7689067"
    IMAGES[okd-4.1]="okd-4.1@sha256:e7e3a03bb144eb8c0be4dcd700592934856fb623d51a2b53871d69267ca51c86"
    IMAGES[okd-4.2]="okd-4.2@sha256:a830064ca7bf5c5c2f15df180f816534e669a9a038fef4919116d61eb33e84c5"
    IMAGES[okd-4.3]="okd-4.3@sha256:63abc3884002a615712dfac5f42785be864ea62006892bf8a086ccdbca8b3d38"
    IMAGES[ocp-4.3]="ocp-4.3@sha256:d293f0bca338136ed136b08851de780d710c9e40e2a1d18e5a5595491dbdd1ea"
    IMAGES[ocp-4.4]="ocp-4.4@sha256:42497f3a848c2847e3caeff6fbb7f4bb28ee48b692c0541ec7099392067a0387"
fi
export IMAGES

IMAGE_SUFFIX=""
if [[ $KUBEVIRT_PROVIDER =~ (ocp|okd).* ]]; then
    IMAGE_SUFFIX="-provision"
fi

image="${IMAGES[$KUBEVIRT_PROVIDER]:-${KUBEVIRT_PROVIDER}${IMAGE_SUFFIX}:latest}"
export image
