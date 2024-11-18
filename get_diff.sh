#!/bin/bash

# CSVファイル名
output_file="output.csv"

# ファイル名のリスト
files=("k3s" "k0s" "microk8s" "rke2")

# ヘッダを書き込む
echo "data,${data/files[*]}" > "$output_file"

# 項目名をキー、数値を値とした配列を初期化
declare -A data

# 各ファイルからデータを読み込む
for file in "${files[@]}"; do
  while read -r key && read -r value; do
    data["$key,$file"]=$value
  done < "$file"
done

# ユニークな項目名を取得
keys=$(printf "%s\n" "${!data[@]}" | cut -d',' -f1 | sort -u)

# 各項目名ごとに行を出力
for key in $keys; do
  line="$key"
  for file in "${files[@]}"; do
    line+=",$(echo ${data["$key,$file"]:-0})"
  done
  echo "$line" >> "$output_file"
done
