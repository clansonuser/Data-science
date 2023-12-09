#premirere lecture pour voir la structure
readLines("C://Users//lenovo//Downloads//dataTrain_2.csv", n = 2)
readLines("C://Users//lenovo//Downloads//test.csv", n = 2)

#bonne recuperation
data_train = read.csv("C://Users//lenovo//Downloads//dataTrain_2.csv", sep = ";" , header = T)
data_tests = read.csv("C://Users//lenovo//Downloads//test.csv", sep = ";" , header = T)

#oservation des formes et types des var
str(data_train)
summary(data_train)
#remplcer les virgules par des points
replace_commas <- function(df) {
   for (col in names(df)) {
      df[[col]] <- gsub(",", ".", df[[col]])
   }
   return(df)
}

str(replace_commas(data_train))
data_train = replace_commas(data_train)
# on 14 variables et 30000 lignes dans cette base de données. 
# Il y a plusieurs types qui ne sont pas au bon format.
# il faut d'abord regler ce détail avant de continuer
#relancer avec les types distincts pour pour si ça change quelquechose


col_train = names(data_train)
for (i in c(2,3,4,5,7,10,11,12)){
   data_train[,i] = as.factor(data_train[,i])
}
for (i in c(8,9,13,14)){
   data_train[,i] = as.numeric(data_train[,i])
}
str(data_train)
summary(data_train)

