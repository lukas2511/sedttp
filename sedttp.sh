#!/bin/bash
while true; do
  netcat -e 'gsed -e "/GET/{" \
    -e "/\/ /{s///g;h;r index.htm" -e ";d;q0}" \
    -e "/\/index\.html?/{r index.htm" -e ";d;q0}" \
    -e "/\/favicon\.ico/{r favicon.ico" -e ";d;q0}" \
    -e "/\/test\.jpg/{r test.jpg" -e ";d;q0}" \
    -e "};q0;d"' -l -p 8080
  echo "Handled request."
done
