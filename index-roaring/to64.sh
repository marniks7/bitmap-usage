#!/bin/bash

originalFiles=("indexer.go" "indexerv2.go" "model.go" "modev2.go" "optimization.go" "optimizationv2.go"
"search.go" "search_test.go" "searchv2.go" "searchv2_test.go" "utils.go")

for i in "${!originalFiles[@]}"; do
  originalFile="${originalFiles[$i]}"
  tmpFile="${originalFile}.tmp"
  cp "${originalFile}" "${tmpFile}"

  # replace imports
  sed -i "s/model\"/model64\"/g" "${tmpFile}"
  sed -i "s/cache\"/cache64\"/g" "${tmpFile}"
  sed -i "s/index-map\"/index-map64\"/g" "${tmpFile}"
  sed -i "s/validator\"/validator64\"/g" "${tmpFile}"
  sed -i "s/samplev2\"/500k-large-groups\/sample64\"/g" "${tmpFile}"
  sed -i "s/roaring\"/roaring\/roaring64\"/g" "${tmpFile}"

  # replace all paths
  sed -i "s/model\./model64./g" "${tmpFile}"
  sed -i "s/cache\./cache64./g" "${tmpFile}"
  sed -i "s/validator\./validator64./g" "${tmpFile}"
  sed -i "s/roaring\./roaring64./g" "${tmpFile}"
  sed -i "s/samplev2\./sample64./g" "${tmpFile}"

  # replace code
  sed -i "s/uint32/uint64/g" "${tmpFile}"

  # replace back from previous change
  sed -i "s/roaring64\.Statistics/roaring\.Statistics/g" "${tmpFile}"

  # replace package
  sed -i "s/package indexroaring/package indexroaring64/g" "${tmpFile}"

  mv "${tmpFile}" "../index-roaring64/${originalFile}"
done