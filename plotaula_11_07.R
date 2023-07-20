#01 - instalar pacote
install.packages("ggplot2")

#02 - carregar pacote
library(ggplot2)

#03 - atribuicao e leitura da tabela
dtaula <- read.csv2("dtaula1.csv", stringsAsFactors = T)

#04 - plot, FEVE, marcador
ggplot(dtaula) +
  geom_point(aes(x = FEVE, y = marcador), color = 'blue')

#05 - plot FEVE, marcador, estagios da doenca
dtaula$Stage <- factor(dtaula$Stage)

ggplot(dtaula) +
  geom_point(aes(x = FEVE, y = marcador, color = Stage))
