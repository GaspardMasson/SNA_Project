update<-function(n,graphe,C,B,S){
  S <- S[S!=n]
  D <- union(C,B)
  if (all(neighbors(graphe,n) %in% D)){
    C <- union(C,n)
  } else {
    B <- union(B,n)
    new_s = setdiff(neighbors(graphe,n),union(D,S))
    if (length(new_s)>0){
      S <- union(S,new_s)
    }
    for (b in B){
      if (all(neighbors(graphe,b) %in% D)){
        B <- B[B!=b]
        C <- union(C,b)
      }
    }
  }
  return(list(C=C,B=B,S=S))
}

compute_quality<-function(n,graphe,C,B,S,mod){
  res<-update(n,graphe,C,B,S)
  C<-res$C
  B<-res$B
  S<-res$S
  return(mod(graphe,C,B,S))
}

localcom<-function(target,graphe,mod){
  if (is.igraph(graphe) && target %in% V(graphe)){
    C<-c()
    B<-c(target)
    S<-c(V(graphe)[neighbors(graphe,target)]$id)
    S<-S+1
    Q<-0
    new_Q<-0
    while((length(S)>0)&&(new_Q>=Q)){
      QS<-sapply(S,compute_quality,graphe,C,B,S,mod)
      new_Q<-max(QS)
      if(new_Q>=Q){
        s_node<-S[which.max(QS)]
        res<-update(s_node,graphe,C,B,S)
        C<-res$C
        B<-res$B
        S<-res$S
        Q<-new_Q
      }
    }
    return(union(C,B))
  }else{
    stop("invalid arguments")
  }
}