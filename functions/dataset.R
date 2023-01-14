# Create the functions to get a dataset
  
# init_dataset prend un graphe, calcule les modularités L R et M et renvoie un dataset avec les ARI de chaque noeud pour chaque modularité 
# + le meilleur ARI (notre classe qu'on voudra prédire)

init_dataset <- function(G){
  M <- c()
  for (node in V(G)){
    row <- c()
    for (modularity in c(mod_L,mod_R,mod_M)){
      vec <- rep(0,length(V(G)))
      vec[localcom(node,G,modularity)] = 1
      row <- cbind(row,compare(V(G)$value,vec,"adjusted.rand")) #ARI
    }
    row <-cbind(row,which.max(row))
    M <- rbind(M,row)
  }
  return(M)
} 

# calculate_centralities prend un graphe et renvoie un dataset avec les centralités de chaque noeud pour chaque centralité (une vingtaine de centralités)

calculate_centralities <- function(graph){
    library(igraph)
    centralities <- data.frame(degree = degree(graph),
                              betweenness = betweenness(graph),
                              closeness = closeness(graph),
                              eigenvector = eigen_centrality(graph)$vector,
                              pagerank = page.rank(graph)$vector,
                              geodesickpath = geokpath(graph),
                              decay = decay(graph),
                              leverage = leverage(graph),
                              lin = lincent(graph),
                              communicabilitybetweenness = communibet(graph),
                              katz = katzcent(graph),
                              radiality = radiality(graph),
                              markov = markovcent(graph),
                              laplacian = laplacian(graph),
                              barycenter = barycenter(graph),
                              bottleneck = bottleneck(graph),
                              entropy = entropy(graph),
                              crossclique = crossclique(graph)
                              )
    rownames(centralities) <- V(graph)$name
    return(centralities)
}

# create_dataset prend un graphe et renvoie un dataset avec les ARI de chaque noeud pour chaque modularité 
# + le meilleur ARI (notre classe qu'on voudra prédire)
# + les centralités de chaque noeud pour chaque centralité (une vingtaine de centralités)

create_dataset <- function(G){
  return(cbind(init_dataset(G),calculate_centralities(G)))
}