sizing <- 
  function(meas, margC = rev(seq(0.5, 9, 0.01)),
                   margA = seq(0.1, 2.5, 0.01), LLP = 0.05) {
  
  N <- length(meas)
  
  d_acc <- c()
  
  for(cs in margC){
    d_ac <- c()
    for(ca in margA) {
      etat <- rep(NA,N)
      etat[1] <- 1
      dificit <- rep(NA,N)
      dificit[1] <- 0
      
      for(i in 2:N) {
        etat[i] <- min((etat[i-1] + ((ca*meas[i])/(cs*mean(meas)))), 1)
        dificit[i] <- max((1/cs)-etat[i], 0)
        if(dificit[i] == 0) etat[i] <- etat[i] - (1/cs)
        else etat[i] <- 0
      }
      d_ac <- c(d_ac, sum(dificit)/(N))
    }
    d_acc <- c(d_acc, d_ac)
    print(cs)
  }
  lolp <- matrix(d_acc, nrow = length(margC), ncol = length(margA), byrow = T)
  
  # Extract the iso-reliability line.
  lp <- apply(lolp, 1, function(x) which.min(abs(as.numeric(x) - LLP)))
  
  accumulatorCapacity <- margC
  generatorCapacity <- margA[lp]
  
  # Plot the iso-reliability line.
  plot(accumulatorCapacity, generatorCapacity)
  
  res <- rbind(accumulatorCapacity, generatorCapacity)
  return(res)
}
