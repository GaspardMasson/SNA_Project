#CHANGE THE PATH TO YOUR OWN PATH
setwd("C:/Users/gaspa/OneDrive/CYTech/ING3/SNA_Project")

# Import the libraries

library("igraph")
library("CINNA")
library("centiserve")
library("expm")


# Import the functions

# mod_R,mod_M,voisins,mod_L
source("functions/modularity.R",local=T)
# update, compute_quality, localcom
source("functions/localcommunity.R",local=T)
# init_dataset, calculate_centralities, create_dataset
source("functions/dataset.R",local=T)


# Import the data

dolphins <- read.graph("Data/dolphins.gml",format="gml")
football <- read.graph("Data/football.gml",format="gml")
karate <- read.graph("Data/karate.gml",format="gml")
polbooks <- read.graph("Data/polbooks.gml",format="gml")

# Create the dataset for the graphs

dolphins_dataset = create_dataset(dolphins)
football_dataset = create_dataset(football)
karate_dataset = create_dataset(karate)
polbooks_dataset = create_dataset(polbooks)

# Save the dataset in a csv file

write.csv(dolphins_dataset, file = "outputs/dolphins_dataset.csv", append = FALSE, quote = TRUE, sep = ";")
write.csv(football_dataset, file = "outputs/football_dataset.csv", append = FALSE, quote = TRUE, sep = ";")
write.csv(karate_dataset, file = "outputs/karate_dataset.csv", append = FALSE, quote = TRUE, sep = ";")
write.csv(polbooks_dataset, file = "outputs/polbooks_dataset.csv", append = FALSE, quote = TRUE, sep = ";")


