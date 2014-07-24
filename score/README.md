イベントのボーダーライン推移
====

## 概要

@llborder\_updateのツイートから, スコア推移を取得. 

データを整理しました. 

## 内容

* ファイル
 * getTweet.R : ツイートの取得
 * dataProcess.Rmd : データの整理_
 * LoveLiveScore_modified.csv: 整理されたデータ
 * makePlot.Rmd : 簡単な可視化をしてみました
 * makePlot.html : レポートです.

* スコアのデータ: LoveLiveScore_modified.csvについて. 
 * 時刻と2枚, 1枚取りボーダーのスコアが入っています. 
 * 時刻はGMTです. 日本時間にするために9時間足します. 

