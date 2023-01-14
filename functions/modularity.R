# function which compute the local modularity R : Bin/(Bin+Bout)

mod_R <- function(G,C,B,S){
  B_in <- length(E(G)[B %--% B])
  B_out <- length(E(G)[B %--% S])
  
  return(B_in/(B_in+B_out))
}


# function which compute the local modularity R : Din/Dout

mod_M <- function(G,C,B,S){
  D <- union(C,B)
  D_in <- length(E(G)[D %--% D])
  D_out <- length(E(G)[B %--% S])
  
  return(D_in/D_out)
}

# On commence par créer une fonction voisin qui renvoie les voisins du noeud n dans le set E dans le graphe G:

voisins <- function(n,G,E){
  return(length(intersect(neighbors(G,n),E)))
}

mod_L <- function(G,C,B,S){
  D <- union(C,B)
  Lin <- sum(sapply(D,voisins,G,D))/length(D)
  Lout <- sum(sapply(D,voisins,G,S))/length(B)
}