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


        


  
