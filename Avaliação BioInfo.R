#Baixando e carregando pacotes
install.packages("randomForest")
library(randomForest)
library(ggplot2)

#Criando scatter plot com o dataframe iris
library(ggplot2)  #carregando o pacote
install.packages("hrbrthemes") #baixando pacote
library(hrbrthemes)
library(ggplot2)
iris

# Gráfico de dispersão usando o dataframe iris
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) +
  geom_point(alpha = 0.5, size = 4) +
  theme_bw() +
  scale_color_manual(values = c("setosa" = "darkblue", "versicolor" = "hotpink", "virginica" = "darkgreen")) +
  labs(x = "Comprimento da Sépala", y = "Largura da Sépala", color = "Espécies") +
  guides(shape = guide_legend(override.aes = list(size = 3))) +
  theme(legend.position = "right",
        legend.title = element_blank(),
        legend.key.size = unit(1, "lines"),
        panel.background = element_rect(fill = "lightgrey"),
        axis.text = element_text(size = 11, color = "black"),
        axis.title = element_text(size = 12, color = "black", face = "bold"))

# Boxplot usando o dataframe iris
ggplot(iris, aes(x = Species, y = Sepal.Width, color = Species)) +
  geom_boxplot() +
  geom_point(size = 3) +
  theme_ipsum() +
  labs(x = "Espécies", y = "Largura da Sépala", title = "Boxplot Largura da sépala  por espécies") +
  theme(legend.position = "right",
        legend.text = element_text(size=11),
        legend.title = element_blank(),
        axis.title.x = element_text(face = "bold", size = 12, color = "black"),
        axis.title.y = element_text(face = "bold", size = 12, color = "black"),
        axis.title = element_text(hjust = 0.5, vjust = -0.5),
        panel.background = element_rect(fill = "transparent"))

ggplot(iris, aes(x = Species, y = Sepal.Width, color = Species)) +
  geom_boxplot() +
  geom_point(size = 3) +
  theme_bw() +
  labs(x = "Espécies", y = "Largura da Sépala", title = "Boxplot Largura da sépala por espécies") +
  theme(plot.title = element_text(size = 12, colour = "black", face = "bold")) +
  theme(axis.title = element_text(size = 12, colour = "black", face = "bold")) +
 theme(legend.position = "right",
        legend.text = element_text(size=11),
        legend.title = element_blank(),
        panel.background = element_rect(fill = "lightgrey"))


####### Random Forest
library(tidyverse)
library(readxl)
library(ggplot2)
library(glue)
library(ggtext)
library(ggpubr)
install.packages("caret")
library(caret)
library(randomForest)


data("iris")
# Dividir o conjunto de dados em treino e teste
set.seed(42)  # Define um ponto para reprodutibilidade
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[trainIndex, ]
test_data <- iris[-trainIndex, ]

# Construir o modelo Random Forest
rf_model <- randomForest(Species ~ ., data = train_data, ntree = 100)

# Visualizar o modelo
print(rf_model)

# Fazer previsões usando o modelo
predictions <- predict(rf_model, test_data)

# Avaliar a precisão do modelo
confusion_matrix <- confusionMatrix(predictions, test_data$Species)
print(confusion_matrix)


####################### Códigos de André ###############################
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
data <- transform(data, type=as.factor(type))
data=na.omit(data)


sapply(data, class)
summary(data)


sample = sample.split(data$type, SplitRatio = .70)

train = subset(data, sample == TRUE)
test  = subset(data, sample == FALSE)

dim(train)
dim(test)


#Create a Random forest model
rf <- randomForest(x=train[,-4], y=train[,4], ntreeTry=500, mtry=2, importance=F, keep.forest=T)

rf
plot(rf, main = "Random Forest")
axis(2)
importance(rf)
varImpPlot(rf,bg = "skyblue", cex=1.5, main = "Feature Importance")

#Make predictions on test data

pred = predict(rf, newdata=test)
pred

confusionMatrix(table(pred, test$type))


#######################################


######## Loop de um obj de 1 a 10 ##########
obj1 <- c(1:10)
print(obj1)
for (i in obj1) {
  print(i)
}
   #####################

#Construção do boxplot com o df iris
library(ggplot2)
library(ggpubr)

# Carregar o conjunto de dados iris
data(iris)

# Script para o dataframe iris
p1 <- iris %>%
  ggplot(aes(x = Species, y = Sepal.Length, fill = Species)) +
  labs(title = "Comprimento da Sépala pela espécie", x = NULL, y = "Comprimento da Sépala") +
  geom_boxplot(show.legend = F, outlier.shape = NA, alpha = 0.3, width = 0.6, coef = 0) +
  geom_point(aes(colour = factor(Species), fill = factor(Species)), shape = 21, size = 3, alpha = .7,
             show.legend = F, position = position_jitter(width = 0.15)) +
  scale_x_discrete(labels = c("setosa", "versicolor", "virginica")) +
  scale_fill_manual(values = c("seagreen3", "pink", "#144272")) +
  scale_colour_manual(values = c("black", "black", "black")) +
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill = "white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold", hjust = 0.5))

# Comparar médias usando wilcox.test
compare_means(Sepal.Length ~ Species, data = iris, method = "wilcox.test")
my_comparisons <- list(c("setosa", "versicolor"), c("setosa", "virginica"), c("versicolor", "virginica"))
p1 <- p1 + stat_compare_means(comparisons = my_comparisons, size = 5)

# Exibir o gráfico
print(p1)

# Salvar o gráfico em um arquivo PDF
pdf("Sepal.length.pdf", width = 7, height = 6)
print(p1)
dev.off()



        


  
