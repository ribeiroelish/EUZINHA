library(dbplyr)
library(ggplot2)
library(glue)
library(ggpubr)
library(magrittr)

df<-read.csv("genetic_ARVC_miRNA.txt", sep = "\t", header = T)
names(df)   #sep = "\t" significa que os valores no arquivo de dados é separado por tabulações. header = T significa que tem cabeçalho

df_1=df %>%
  dplyr::filter(Mutation %in% c("Gene elusive","Gene Positive"))

T0_n <- df_1 %>% 
  dplyr::filter(Mutation == "Gene elusive") %>% 
  nrow()

T1_n = df_1 %>% 
  dplyr::filter(Mutation == "Gene Positive") %>% 
  nrow()

df_1$Mutation <- factor(df_1$Mutation, 
                          levels = c("Gene elusive","Gene Positive"))
p1 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR92a3p, fill=Mutation))+
  labs(title="hsa-miR92a-3p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})")))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR92a3p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR92a3p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p1 = p1 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5)
p1

pdf("hsa-miR92a-3p_genetic_ElusiveVSothers2.pdf", width = 7, height = 6)
p1
dev.off()

p2 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR165p, fill=Mutation))+
  labs(title="hsa-miR16-5p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})")
                              ))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR165p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR165p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p2 = p2 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5)
p2
pdf("hsa-miR16-5p_genetic_ElusiveVSothers3.pdf", width = 7, height = 6)
p2
dev.off()

p3 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR15a5p, fill=Mutation))+
  labs(title="hsa-miR15a-5p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})")
                             ))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR15a5p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR15a5p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p3 = p3 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5) 
p3

pdf("hsa-miR15a-5p_genetic_ElusiveVSothers2.pdf", width = 7, height = 6)
p3
dev.off()

p4 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR1455p, fill=Mutation))+
  labs(title="hsa-miR145-5p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})") 
                              ))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR1455p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR1455p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p4 = p4 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5)
p4
pdf("hsa-miR145-5p_genetic_ElusiveVSothers2.pdf", width = 7, height = 6)
p4
dev.off()

p5 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR19a3p, fill=Mutation))+
  labs(title="hsa-miR19a-3p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})") 
                              ))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR19a3p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR19a3p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p5 = p5 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5)
p5
pdf("hsa-miR19a-3p_genetic_ElusiveVSothers2.pdf", width = 7, height = 6)
p5
dev.off()

p6 <- df_1 %>%
  ggplot(aes(x=Mutation, hsamiR29a3p, fill=Mutation))+
  labs(title="hsa-miR29a-3p", x=NULL, y="Relative miRNA Expression")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.3, width=0.6, coef=0)+
  geom_point(aes(colour=factor(Mutation), 
                 fill = factor(Mutation)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("Gene elusive","Gene Positive"), 
                   labels = c(glue("Gene elusive (N={T0_n})"),
                              glue("Gene Positive (N={T1_n})") 
                              ))+
  scale_fill_manual(values=c("#89c2ff","#144272"))+
  scale_colour_manual(values=c("black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5))

compare_means(hsamiR29a3p ~ Mutation, data = df_1, method = "wilcox.test")
compare_means(hsamiR29a3p ~ Mutation, data = df_1, method = "kruskal.test")
my_comparisons <- list( c("Gene elusive","Gene Positive"))
p6 = p6 + stat_compare_means(comparisons = my_comparisons, size=5)
stat_compare_means(label.y = 10, size=5)
p6
pdf("hsa-miR29a-3p_genetic_ElusiveVSothers2.pdf", width = 7, height = 6)
p6
dev.off()

getwd()
