# kube_count_res

複数のクラスタにあるkubernetesリソースを取得しcsvにまとめます．

## 使い方

1. .kube/configにコンテキストを追加(デフォルトではk3s, k0s, microk8s, rke2が設定されている想定)
2. 登録したコンテキストをcount_resource.shを編集してclustersの部分に記入する
3. ./count_resource.shで実行すると各コンテキスト名のファイルが出来上がる(今入っているのは私の環境で実行した結果です．実行を行うと内容が上書きされます．)
4. 各ファイルに1行目に空白行が入るので削除(そのうち勝手に消せるようにします．)
6. get_diff.shを編集してfilesにコンテキスト名を記入する．
7. output.csvの内容を削除(今入っているoutput.csvは私の環境で実行した結果です．)
8. ./get_diff.shで実行するとoutput.csvに結果が出力されます．

 ## 実行結果の例
 
 クラスタ名のファイル(全体の例は./data/k3sを参照)
 
 https://github.com/cdsl-research/kube_count_res/blob/main/data/k3s
 
 ![image](https://github.com/user-attachments/assets/e22a0c06-0636-4bbd-859a-a7ccbc1ed2a7)

---

 output.csv(全体の例は./output.csvを参照)
 
https://github.com/cdsl-research/kube_count_res/blob/main/output.csv
 
 ![image](https://github.com/user-attachments/assets/40d3bf50-f785-4ae6-a3d1-5be88aaf448e)

