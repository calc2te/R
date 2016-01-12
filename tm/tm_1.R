library(KoNLP)
library(tm)

#data <- read.csv("/Users/Seobs/Downloads/crowd_request (3).csv")
data <- read.csv("/Users/Seobs/Downloads/bbs_pro.csv")

#data$nouns <- data$answer
data$nouns <- data$comment

#data$nouns <- sapply(data$nouns, removeHtml)

data$nouns <- gsub("&lt;","",data$nouns)
data$nouns <- gsub("&gt;","",data$nouns)
data$nouns <- gsub("&quot;","",data$nouns)
data$nouns <- gsub("&amp;","",data$nouns)
data$nouns <- gsub("<br/>","",data$nouns)

data$nouns <- sapply(data$nouns, function(x) {
  extractNoun(x)
})

myCorpus <- Corpus(VectorSource(data$nouns))

myTdm <- TermDocumentMatrix(myCorpus, control = list(wordLengths = c(2, Inf)))
#findFreqTerms(myTdm, lowfreq = 10)

library(wordcloud)
m <- as.matrix(myTdm)

wordFreq <- sort(rowSums(m), decreasing = TRUE)
set.seed(375)
pal <- brewer.pal(8, "Dark2")
wordcloud(words = names(wordFreq), freq = wordFreq, min.freq = 10, random.order = F, 
          rot.per = 0.1, colors = pal, family="Korea1")

?wordcloud
warnings()
names(pdfFonts())
pdfFonts()

install.packages("extrafont")
require(extrafont)
fonts()
fontNo=length(fonts())
plot(1:fontNo,type="n",xlab="",ylab="",main="사용할 수 있는 폰트")
for(i in 1:fontNo) text(fontNo/2,i,paste(fonts()[i],"한글이 멋있다"),family=fonts()[i])