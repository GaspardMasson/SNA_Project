#CHANGE THE PATH TO YOUR OWN PATH
setwd("C:/Users/gaspa/OneDrive/CYTech/ING3/Social Network/Projet/SNA_Project")

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

dolphins <- read.graph("../Data/dolphins.gml",format="gml")


# Create the dataset for the dolphins graph

dolphins_dataset = create_dataset(dolphins)

# Save the dataset in a csv file

write.csv(dolphins_dataset, file = "outputs/dolphins_dataset.csv", append = FALSE, quote = TRUE, sep = ";")

