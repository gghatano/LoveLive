データで遊ぶ
====

## pixiv

pixivからデータを引っ張ってきて, ネットワーク解析しました. 

結果: [http://gghatano.github.io/LoveLive/pixiv/couple.html]

### データ取得

* 進捗: ![Progress](http://progressed.io/bar/100)

 * pixivの小説タグを拾ってパースして集計

### 可視化

* 進捗: ![Progress](http://progressed.io/bar/100)

 * igraphに接続行列を渡してネットワークに

### 画像貼り付け

* 進捗: ![Progress](http://progressed.io/bar/100)

 * pngで画像を用意
 * library(png)でpngデータを読み込み
 * locatorで座標を取得, アイコンをネットワークの図に貼り付け. 


## score 

過去イベントのスコア推移を見て, n枚どりのボーダーライン推定をしたいです. 

### データ取得

* 進捗: ![Progress](http://progressed.io/bar/50)

 * 現状, 生データのまま.
 * イベント, 時刻とその時刻でのボーダーラインが取得できています.
 * ほしいところを切り出すところがまだです. 


### モデル作成と推定

* 進捗: ![Progress](http://progressed.io/bar/0)
 * 何もしていない
