#!/bin/bash -e

DIR=$(dirname $(readlink -f "$0"))

echo "Unipatcher started... (${DIR})"

for sedscriptfile in `find ./unipatcher -name '*.sedscript'`; do
    echo "Found sedscript to apply: ${sedscriptfile}"
    applyfilepath="${sedscriptfile/.\/unipatcher\/tree/}"
    applyfilepath="${applyfilepath/.sedscript/}"
    echo "Will be applied to: ${applyfilepath}"
    sed -r -i -f ${sedscriptfile} ${applyfilepath}
done
