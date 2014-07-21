
## ------------------------------------------------------------------------
tag = "ラブライブ"
page = 10
urls = paste("http://spapi.pixiv.net/iphone/search_novel.php?s_mode=s_tag&p=", seq(page), "&word=", tag, sep="")
write.table(urls, "urls.txt", row.names=FALSE, col.names=FALSE, quote=FALSE)
#system("mkdir files")
#system("wget -i urls.txt -P files/")


## ------------------------------------------------------------------------
fs = list.files(path = "files/")
library(dplyr)
library(data.table)
data0 = NULL
for(i in seq(fs)){
  pb = txtProgressBar(min=1, max=length(fs), style=3)
  setTxtProgressBar(pb,i)
  data0 = rbind(data0, read.csv(paste("files/", fs[i], sep=""), header=FALSE))
}

## 各データフレームからタグを抽出
## 14列目に全部入っているので, そこを分解すればタグが得られる
tags = data0$V14 %>% as.character %>% strsplit(" ") %>% unlist
tags_unique = data0$V14 %>% unique %>% as.character %>% strsplit(" ") %>%  unlist



## ------------------------------------------------------------------------
## ミューズのメンバー 
member = c("こと", "うみ", "ほの", "りん", "ぱな", "まき", "のぞ", "えり", "にこ")
## カップルに対応する要素が入っている行列
couple = outer(member, member, FUN = paste, sep="")
## 各カップルに対応する数字が入る行列
couple_tag_num = diag(0, length(member))
dimnames(couple_tag_num) =  list(member, member)
# ## タグとカップル名が一致していたら, そのカップル名のtag_numを+1する
# for( i in 1:length(tags)){
#   pb = txtProgressBar(min=1, max=length(tags), style=3)
#   setTxtProgressBar(pb,i)
#   couple_tag_num[couple == tags[i]] = couple_tag_num[couple == tags[i]] + 1
# }

## uniqueバージョン
for( i in 1:length(tags_unique)){
  pb = txtProgressBar(min=1, max=length(tags_unique), style=3)
  setTxtProgressBar(pb,i)
  couple_tag_num[couple == tags_unique[i]] = couple_tag_num[couple == tags_unique[i]] + 1
}

couple_tag_num


## ------------------------------------------------------------------------
library(igraph)
g0 <- graph.adjacency(couple_tag_num)
V(g0)$size <- 30
V(g0)$color <- NA
V(g0)$frame.color <- NA
V(g0)$shape <- "square"
lay <- layout.auto(g0)
plot(g0, layout=lay)
title("pixiv小説タグ頻度から考えたラブライブカップリング")



