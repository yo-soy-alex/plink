#Tentando transformar arquivo matriz de genotipo em bed
install.packages("pacman")

pacman::p_load("genio", "dplyr", "magrittr")

#Lendo matriz

genotipos <- read.table(file = "/home/alex/melhoramento_animal/SNPs/Melhoramento_animal/genotipos.ped")

#criamos o um objeto que representa o arqivo fam
#pegando as 6 primeiras colunas do .ped

genotipos_fam = data.frame(genotipos[,1:6])

#Precisamos eliminar tudo que n~ao seja snps (coluna 1 ate a 6)
genotipos[,1:6] <- NULL
genotipos <- as.matrix(genotipos)

class(genotipos)

#substituir "5" por NA caso ouver
genotipos[genotipos == "5"] = NA
table(genotipos) #Verifica que so tem valores de 0, 1 e 2

#TEm que fazer a transposta para ele enterder direito
genotipos_transposta <- t(genotipos)

#Os nomes das linhas precisam ter os nomes dos snps
rownames(genotipos_transposta) = paste0("snp", 1:nrow(genotipos_transposta))

colnames(genotipos_fam) = c("fam", "id", "pat", "mat", "sex", "pheno")

#criando o bim a partir do .map
genotipo_bim <- read.table(file = "/home/alex/melhoramento_animal/SNPs/Melhoramento_animal/Mapa_NEL_PZCQ.txt", header = TRUE)

genotipo_bim <- genotipo_bim %>%
  select(chr, SNP, pos) %>%
  mutate(SNP = paste0("snp", SNP)) %>%
  mutate(morgan = 0) %>%
  select(chr, SNP, morgan, pos)
  

#Adicionamos as colunas dos alelos
genotipo_bim["V5"] <- 2
genotipo_bim["V6"] <- 1

colnames(genotipo_bim) = c("chr", "id", "posg", "pos", "alt", "ref")

#gera os arquivos .bed, .bim e .fam 
write_plink("genotipos",
            genotipos_transposta,
            bim = genotipo_bim, 
            fam = genotipos_fam,
            pheno = NULL,
            verbose = TRUE,
            append = FALSE,
            write_phen = FALSE
)
