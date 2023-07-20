# 1 Criando o gráfico de pontos para o dataframe iris
getwd()
library(ggplot2)
iris
?theme
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, shape=Species, color = Species, fill = Species )) +
  geom_point() +
  theme(axis.text = element_text(angle =90, color="red", size=10, face=3), 
axis.line = element_line(size = 0.8, colour = "black", linetype=1), 
axis.title = element_text(size = 10, colour = "green", face=3), 
plot.background = element_rect(fill = "white")) + 
  labs(x="Comprimento da Petala", y="Largura da Petala") 
  



####Gráfico ggplot2
lbbm <- read.csv("dtaula1.csv", stringsAsFactors=T)
lbbm <- dtaula
library(ggplot2)    
ggplot(lbbm, aes(x=FEVE, marcador, color=Stage)) + geom_point()+
  theme(axis.line = element_line(size=1, colour = "pink", linetype=1)) +
  labs(y="MARCADOR", title = "IC")
###########
#%>% #sinal de continuidade 
nrow #conta o número de linhas
install.packages("pheatmap")
library(pheatmap)

####Antonia
getwd()
df <- read.csv("antonia.doc.csv", sep = ";", header =T, stringsAsFactors = T)
ggplot(df, aes(x=log2FC_ROS, y=pvalue_ROS), color = gene_name_ROS, fill = gene_name_ROS, shape = gene_name_ROS) + geom_point() 

#posição da legenda
theme_set(
  theme_light()+
    theme(legend.position ="right"))

#fonte 
theme(axis.title = element_text(face = "italic", family = "Arial", colour = "blue", size = 8))
  