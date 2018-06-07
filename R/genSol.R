genSol <- 
  function(nbr, seqStats, moy, variance){
    
    meas <- matrix(nrow = nbr, ncol = ncol(moy))
    
    # The fitted transition matrix P underlying the class sequence
    mcFitMLE <- markovchainFit(data = seqStats)

    # Drawing new sequence from P
    mcD <- rmarkovchain(n = nbr, object = mcFitMLE$estimate, t0 = "1")
    mcD <- as.numeric(mcD)
    
    # Drawing new sequence of clearness index from mcD
    k <- as.numeric(levels(factor(mcD)))
    for(i in 1:length(mcD)){
      meas[i, ] <- rtmvnorm(1, mean = moy[mcD[i], ], sigma = variance[[mcD[i]]], upper = rep(1, ncol(moy)),
                            lower = rep(0, ncol(moy)))
    }
    
    return(meas)
  }
