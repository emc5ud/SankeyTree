## ----  Using Decision Trees  -------------------

## Example: Identifying Risky Bank Loans ----
## Step 2: Exploring and preparing the data ----
note <- read.csv("~/Downloads/data_banknote_authentication.txt",header = FALSE)

colnames(note) <- c("variance","skewness","curtosis","entropy","class")
note$class <- as.factor(note$class)

set.seed(12345)
note_rand <- note[order(runif(nrow(note))), ]

# split the data frames
note_train <- note_rand[1:(nrow(note)*.8), ]
note_test  <- note_rand[(nrow(note)*.8+1):nrow(note), ]

# check the proportion of class variable
prop.table(table(note_train$class))
prop.table(table(note_test$class))

## Step 3: Training a model on the data ----
# build the simplest decision tree
library(C50)
library(party)
library(gmodels)

note_model <- ctree(class ~ ., data = note_train)
note_pred <- predict(note_model, note_test)
CrossTable(note_test$class, note_pred)


#plotting some of the node "decisions"
par(bg=rgb(9/255,0,17/255))
hist(note_train[note_train$class=="1",]$variance, col=rgb(1,0,0,0.8),xlim=c(-10,10), ylim=c(0,130), main="",xlab="Variance",col.axis = "white",col.lab = "white", col.main = "white",yaxt="n",ylab = "")
hist(note_train[note_train$class=="0",]$variance, col=rgb(.22, 1, .29,0.5),add=T)
abline(v=.38,col="white", lwd=10)


hist(note_train2[note_train2$class=="1",]$skew, col=rgb(1,0,0,0.8),xlim=c(-14,14), ylim=c(0,100), main="",xlab="Skewness",col.axis = "white",col.lab = "white", col.main = "white",yaxt="n",ylab = "")
hist(note_train2[note_train2$class=="0",]$skew, col=rgb(.22, 1, .29,0.5),add=T)
abline(v=7.4,col="white", lwd=10)

hist(note_train19[note_train19$class=="1",]$variance, col=rgb(1,0,0,0.8),xlim=c(-10,10), ylim=c(0,100), main="",xlab="Variance",col.axis = "white",col.lab = "white", col.main = "white",yaxt="n",ylab = "")
hist(note_train19[note_train19$class=="0",]$variance, col=rgb(.22, 1, .29,0.3),add=T)
abline(v=1.74,col="white", lwd=10)

hist(note_train20[note_train20$class=="1",]$curtosis, col=rgb(1,0,0,0.8),xlim=c(-6,2), ylim=c(0,40), main="",xlab="Curtosis",col.axis = "white",col.lab = "white", col.main = "white",yaxt="n",ylab = "")
hist(note_train20[note_train20$class=="0",]$curtosis, col=rgb(.22, 1, .29,0.3),add=T)
abline(v=-2.2,col="white", lwd=10)





