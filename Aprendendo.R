#tarefa é colocar tudo em prática
#pegar uma df de alguém e testar todas as funções
data.frame(iris)
install.packages("ggplot2")
library(ggplot2)
?mean
help(mean)
??ggplot2
vignette(package = "ggplot2")
3+5
2 * 2 - (4+4) / 2
### Objeto é um nome que guarda um valor. Para criar um objeto, utilizamos o operador <-.###
### Regras para nomear objetos: 1. O nome deve começar com uma letra;. 2. O nome pode conter números, mas não pode começar com números; 3. Você pode usar pontos (.) e underlines (_) para separar palavras.    
###Enquanto objetos são nomes que guardam valores, funções no R são nomes que guardam um código de R. A ideia é muito simples: sempre que você rodar uma função, o código que ela guarda será executado e um resultado nos será devolvido. ex: nomedafunçao(Arg1, Arg2, Arg 3,..,Argn)###
### Sempre separar os argumento por vírgula (,).###
sum(1:7)
33 / 11
divisao <- 33/11 
25*12
idade_em_meses <- 25*12
idade_em_meses * 30
idade_em_dias <- idade_em_meses*30
###Data frames###São objetos que guardam nossos dados. São equivalentes a uma planilha de Excel. Possuem linhas e colunas###
?mtcars
?iris
###CLASSES### Para criar texto no R, colocamos os caracteres entre aspas. As aspas servem para diferenciar nomes (objetos, funções, pacotes) de textos (letras e palavras).###
#Textos são chamados de strings###
class(5)
y <- ("f")
class(y)
###Classes básicas: numeric, character, logical.###
###Geralmente serão utilizados como sinônimos:número, valor real, numeric, double, texto, string, character, caracteres, lógico, logical, booleano, valor TRUE/FALSE###
nome <- "Elis Helena da Silva Ribeiro"
?paste
cidade <- "Natal"
estado <- "RN"
nchar(cidade)
paste(cidade, estado)
paste(cidade, estado, sep = " ")
###Vetores no R são apenas conjuntos indexados de valores. Para criá-los, basta colocar os valores separados por vírgulas dentro de um c()###
vetor1 <- c(1:20)
vetor2 <- c("a","b","c","d","e","f","g")
vetor1[ 2 ]
vetor2 [c(5, 6)]  #operação chamada subsetting-pegar subconjuntos de valores de um vetor.#
F <- c(3, 5, "a", "b")
F [c(2,4)]  
e <- c(1,2)
d <- c(5, 10, 12, 15, 58, 85, 40)
sum(1:100)
###Para acessar indivualmente cada valor de um vetor, é só colocar o indice do valor dentro de []. 
# vetor [posição] ... #para o objeto d, achar o valor que está na posição 4:###
d[4]
###Para encontrar mais de um valor é só colocar os índices ente[c()]. EX:
d[c(1,6)]    ###OPERAÇÃO CHAMADA DE SUBSETTING!
#Vetorização: o R irá alinhar os dois vetores e somar elemento a elemento
vetor1 <- c(4,5)
vetor2 <- c(4,5,6,7)
vetor1 + vetor2    ##Reciclagem: os vetores não tem o mesmo tamanho, mas se somaram. o vetor1 ficou dessa forma para o R: vetor1 <- c(4,5,4,5)
vetor1+1    ###aqui está somando o vetor 1 + c(1,1)
####OBS: o R não processa a soma de vetores que não são multiplos um do outro. EX: 
vetor4 <- c(7,8,9)
vetor5 <- c(9,5,6,4,2)
vetor4 + vetor5

#####EXERCICIOS#####

eu <- c(0:5)
eu[1]
eu[6]
vetor_negativo <- eu * -1
frutas <- c("banana","maça", "uva")
length(frutas)
?paste

past("eu gosto de", frutas)   ###Função paste: concatena vetores e converete em caracteres
vc <- c(1,2,"bom")

dolar_subiu <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)
length(dolar_subiu)
dolar_subiu[4]
sum(dolar_subiu)
###Testes logicos###
#TRUE ou FALSE. Ex: 
#== x é igual a y?
1==2
2==2
###Também podemos testar se dois valores são diferentes. Para isso, usamos o operador !=
34 != 94
###Com o operador %in%. podemos verificar se um valor está dentro de um conjunto de valores (vetor).
vetor2%in% c(4,5,6)
minha_coluna <- c(1, 3, 0, 10, -1, 5, 20)
minha_coluna[minha_coluna >3]

###Armazenamento de fatores###
cargahoraria <- c(220,220,110,110,90)
summary(cargahoraria)
as.factor(cargahoraria)
is.factor(cargahoraria)
d <- list(5,8,"8",2)
as.factor(d)
e <- list(c(10,6,51,5), "2",8)
str(e)

###Matriz###
m <- matrix(1:9, nrow = 3)
m
mode(m)
class(m)
###m[linha, coluna]
m[1,3]
m[1,3] <- "a"  #Aqui serve para trocar um objeto dentro da matriz inicial
m
class(m)
 
###Encontrar diretorio
getwd() 
#ou
setwd("C:\\Users\\Elis\\OneDrive\\Documentos\\BioInfoClass\\EUZINHA")  #precisa escrever dentro do () colocar aspas e botar \\ ou entrão mudar todas por /.
dt <- read.csv("dtaula1.csv", sep = ";")
names(dt)
library(ggplot2)
ggplot(dt, aes(x = marcador, y = FEVE, color=Stage)) + geom_point(size=3)
         
###Funções
names()  #Essa função retorna o titulo de cada coluna 
%>% 
### header=T(parâmetro) significa que tem cabeçalho. (Isso para a função read.csv)




###ggplot##
library(ggplot2)
iris
data(iris)
ggplot(data = iris)
browseVignettes(package = dplyr)
install.packages(dplyr)
library(dplyr, warn.conflicts = FALSE)
install.packages("dplyr")
library(dplyr)
vignette("introduction", package =dplyr)
?aes
