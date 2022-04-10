#!/bin/bash

originalFiles=("test-data.go" "test-data_test.go")

for i in "${!originalFiles[@]}"; do
  originalFile="${originalFiles[$i]}"
  tmpFile="${originalFile}.tmp"
  cp "${originalFile}" "${tmpFile}"

  # replace imports
  sed -i "s/model\"/model64\"/g" "${tmpFile}"
  sed -i "s/cache\"/cache64\"/g" "${tmpFile}"
  sed -i "s/index-map\"/index-map64\"/g" "${tmpFile}"
  sed -i "s/validator\"/validator64\"/g" "${tmpFile}"

  # replace all paths
  sed -i "s/model\./model64./g" "${tmpFile}"
  sed -i "s/cache\./cache64./g" "${tmpFile}"
  sed -i "s/validator\./validator64./g" "${tmpFile}"

  # replace package
  sed -i "s/package samplev2/package sample64/g" "${tmpFile}"

  mv "${tmpFile}" "../sample64/${originalFile}"
done