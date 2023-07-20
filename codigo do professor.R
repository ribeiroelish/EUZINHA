#install.packages('randomForest')
library(randomForest)
#install.packages('caTools')
require(caTools)
library(dplyr)
#install.packages('caret')
library(caret)
#install.packages('e1071', dependencies=TRUE)

data_arvc<-read.csv("data_qPCR_ARVC_validation_clinical_all.txt", sep = "\t", header = T)
names(data_arvc)
View(data_arvc)

data=as.data.frame(data_arvc[,c(3,4,7,21)])

data$type[data$type == "non-ARVC"] <- 0
data$type[data$type == "ARVC"] <- 1

summary(data)
sapply(data, class)
data <- transf

###
T0_n = data_group %>% 
  filter(type == "Control") %>% 
  nrow()
T1_n = data_group %>% 
  filter(type == "BrS") %>% 
  nrow()
T2_n = data_group %>% 
  filter(type == "ARVC") %>% 
  nrow()

data_group$type <- factor(data_group$type, 
                          levels = c("Control","BrS","ARVC"))
###
scale_x_discrete(breaks = c("Control","BrS","ARVC"), 
                 labels = c(glue("Control 
                                   (N={T0_n})"), glue("BrS 
                                   (N={T1_n})"), glue("ARVC 
                                   (N={T2_n})")))+