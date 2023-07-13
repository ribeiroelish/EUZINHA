# 1 Criando o gráfico de pontos para o dataframe iris
getwd()
library(ggplot2)
iris
?theme
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point() +
  theme(axis.text = element_text(angle =90, color="red", size=10, face=3), 
axis.line = element_line(size = 0.8, colour = "black", linetype=1), 
axis.title = element_text(size = 10, colour = "green", face=3), plot.background = element_rect(fill = "white")) 



####Gráfico ggplot2
lbbm <- read.csv("dtaula1.csv", stringsAsFactors=T)
lbbm <- dtaula
library(ggplot2)    
ggplot(lbbm, aes(x=FEVE, marcador, color=Stage)) + geom_point()+
  theme(axis.line = element_line(size=1, colour = "pink", linetype=1)) +
  labs(y="MARCADOR", title = "IC")
###########

###gráfico Antônia
library(ggplot2)
getwd()
