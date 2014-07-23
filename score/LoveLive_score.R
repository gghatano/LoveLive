# R のバージョンが > 3.0.1 だと動くと思います
# 最初はここのコメントアウトを消して, パッケージのインストール
# install.packages("twitteR)
# install.packages("ROAuth)

library("twitteR")
library("ROAuth")
library("dplyr")
library("data.table")

# 各種keyの登録 アカウント名: suuri3lab
twit.oauth <- OAuthFactory$new(
  handshakeComplete = TRUE,
  signMethod="HMAC",
  consumerKey = "jfdvPrKnhL2LPc9rOEYhg",
  consumerSecret = "PwTEPeCh4EdyHZv0cQzGVzRSIjDhuFPvuKFoE0caA",
  oauthKey = "2307706668-lOUu9jZ4OTNvvpytu1D97p4i6aWvJ6A9aAmRqaP",
  oauthSecret = "WqDUeYgdN6tZhc1wnbJEpMCBA52yL7I6IUI1uveMFRMsm"
)

registerTwitterOAuth(twit.oauth)

n = 1
# ここでアカウント名指定してツイートを取得

## n行目を取得する
get_line = function(text, n){
  return(strsplit(text, "\n")[[1]][n])
}
## ラブライブボーダーつぶやきbot
tweet = userTimeline("llborder_update", 1)
tweet_df = twListToDF(tweet) %>% as.data.table %>% select(text, id) %>% 
  mutate(event = sapply(text, FUN = function(x){as.character(get_line(text=x,n=1))})) %>% 
  mutate(first = sapply(text, FUN = function(x){as.character(get_line(text=x,n=2))})) %>% 
  mutate(second = sapply(text, FUN = function(x){as.character(get_line(text=x,n=3))}))%>%
  select(-text)
tweet_df


# 今のツイートのID
maxid = tweet_df %>% select(id) %>% unlist %>% as.character
maxid = maxid %>% as.numeric -1

for(i in 1:22){
  print(paste("i = " ,i))
  tweet_i = userTimeline("llborder_update", n=100, maxID=maxid) %>% twListToDF %>% as.data.table %>% 
    select(text,id) %>% 
    mutate(event = sapply(text, FUN = function(x){as.character(get_line(text=x,n=1))})) %>% 
    mutate(first = sapply(text, FUN = function(x){as.character(get_line(text=x,n=2))})) %>%
    mutate(second = sapply(text, FUN = function(x){as.character(get_line(text=x,n=3))})) %>% 
    select(-text)
  tweet_df = rbind(tweet_df, tweet_i) 
  maxid = tweet_df %>% select(id) %>% tail(1) %>% unlist %>% as.character %>% as.numeric
  maxid = maxid - 1
}
  
## 保存しておく
tweet_df %>% write.table("LoveLive_score.csv", row.names=FALSE, sep=",")


dat = fread("LoveLive_score.csv")
text = "7000位： 9444444pts（+33333pts）" %>% tolower
