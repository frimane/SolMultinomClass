multinomDirClass <-
function(measures , n.it = 10000, n.B.in = 3000, zi = rep(1, N),
                             alf = 3, seed = 2308.2202, talk = T) {
  
  # for the code reproducibility
  set.seed(seed)
  
  #**********************************************************************************************
  # update functions   
  #**********************************************************************************************
  #  • update parameters conditional on the data, the in-
  #    dicators and the hyperparameters;
  updateParameters <- function(x = rep(0,D)){
    
    if (is.vector(x)) x <- matrix(x, nrow = 1)
    sumX <- apply(x, 2, sum) + hyperParameters
    
    return(sapply(sumX, function(y) rgamma(1, shape = y, scale = 1)))
  }
  
  #  • update hyperparameters conditional on the parameters ;
  updateHyperParameters <- function(x, datA) {
    
    loglikelihood = sum(dgamma(datA, shape=x, scale = 1, log=T))
    logprior = dgamma(x, shape =  1, scale  = 1 , log = T)
    
    return( loglikelihood + logprior )
  }
  
  #  • update each indicator variable, conditional on the
  #    data, the other indicators and the hyperparameters;
  updateIndicator <- function () {
    
    pb <- c(log(n.el) + sapply(parameters, function (x)
    {
      multimFactor[j] + sum(measures[j, ] * log(x))
    }), log(alf)  + multimFactor[j] + sum(lgamma(measures[j, ] + hyperParameters) -
                                            lgamma(hyperParameters)) -
      lgamma(sum(measures[j, ] + hyperParameters)) + lgamma(sum(hyperParameters)))
    
    pb <- exp(pb - max(pb))
    pb <- pb/sum(pb)
    
    y <- runif(1)
    z <- 0
    for (k in 1:length(pb) ) {
      z <- z + pb[k]
      if (y < z) break;
    }
    return(k)
  }
  
  #  • update the DP concentration parameter alfa.
  updateAlfa <- function(x) {
    
    return((max(zi)-0.5)*x - 0.5*exp(-x) + lgamma(exp(x)) - lgamma(exp(x)+ N))
  }
  
  posteriorPredictive <- function(x){
    
    return(sum(lgamma(x+hyperParameters) - lgamma(hyperParameters) - lgamma(x+1)) -
             lgamma(sum(x+hyperParameters)) + lgamma(sum(hyperParameters)))
  }
  
  # markov chain monte carlo for sampling alfa (log-normal function)
  McMc <- function(target, x, sd) {
    
    target.x.current <- target(log(x))
    x.current <- log(x)
    x.proposed <- rnorm(1, x.current, sd)
    target.x.proposed <- target(x.proposed)
    log.acceptance <- target.x.proposed - target.x.current
    
    r <- runif(1)
    if (r < exp(log.acceptance)) {
      x.current <- x.proposed
    }
    return(exp(x.current)) 
  }  
  # markov chain monte carlo for sampling hyperparameter posterior distribution
  # (truncated function)
  McMcHp <- function(target, x, datA, sd) {
    
    target.x.current <- target(x, datA)
    x.current <- x
    
    repeat {
      x.proposed <- rnorm(1, x.current, sd)
      if(x.proposed > 0) break;
    }
    
    target.x.proposed <- target(x.proposed, datA)
    log.acceptance <- target.x.proposed - target.x.current
    log.acceptance <- log.acceptance + pnorm(x.current, log.p = T) - 
      pnorm(x.proposed, log.p = T)
    
    r <- runif(1)
    if (r < exp(log.acceptance)) {
      x.current <- x.proposed
    }
    
    return(x.current)
  }
  
  #**********************************************************************************************
  #**********************************************************************************************
  
  #-------------------------------#--------------------------------
  # variables                     #
  # ------------------------------#--------------------------------
  l.max <- -Inf                   # maximum likelihood 
  v.n.cl <- c()                   # for plotting number of classes histogram
  v.af <- c()                     # for plotting alfa histogram
  l.cl <- 0                       # vector of likely class indicator
  #-------------------------------#--------------------------------
  N <- nrow(measures)             # number of observations
  D <- ncol(measures)             # length of observavations
  #-------------------------------#--------------------------------
  n.el <- as.numeric(             # number of elements in each class
    table(factor(zi)))      #
  hyperParameters <- runif(D)     # hyperparameter vector
  #-------------------------------#--------------------------------
  
  #**********************************************************************************************
  
  # calculation of the multinomial factor 
  
  multimFactor <- apply(measures, 1, function(x) lgamma(sum(x)+1) - sum(lgamma(x+1)))
  
  # to determine the calculation time
  t1 <- Sys.time()
  
  # Collapsed Gibbs Sampler
  # The sampling iterations are:
  #  • update parameters conditional on the data, the in-
  #    dicators and the hyperparameters;
  #  • update hyperparameters conditional on the parameters ;
  #  • remove the parameters from representation;
  #  • update each indicator variable, conditional on the
  #    data, the other indicators and the hyperparameters;
  #  • update the DP concentration parameter alfa.
  
  for (i in 1:n.it) {
    
    parameters_ <- lapply(1:max(zi), function(x) updateParameters(measures[zi==x,]))
    parameters <- lapply(parameters_, function(x) x/sum(x))
    
    seq.max <- seq_len(max(sapply(parameters_, length)))
    length_ <- t(sapply(parameters_, "[", i = seq.max))
    hyperParameters <- sapply(1:D, function(x) as.numeric(McMcHp(updateHyperParameters,
                                                                 hyperParameters[x], as.numeric(length_[,x]), 2)))
    
    
    for (j in 1:N) {
      
      n.el[zi[j]] <- n.el[zi[j]] - 1
      if (n.el[zi[j]] == 0) { #--------- relabel clusters                                           
        parameters[[zi[j]]] <- NULL
        n.el <- n.el[-zi[j]]
        zi[zi>zi[j]] <- zi[zi>zi[j]]-1                                                   
      }
      
      zi[j] <- updateIndicator() # --------- drawing a new indicator variable
      
      if (length(n.el) < zi[j]) {
        n.el[zi[j]] <- 1
        normaliz <- updateParameters()
        parameters[[zi[j]]] <- normaliz/sum(normaliz)
      } else {
        n.el[zi[j]] <- n.el[zi[j]] + 1
      }
    }
    
    if (i > n.B.in) {
      
      likely <- sum(sapply(c(1:N), function(x) posteriorPredictive(measures[x,])))
      
      if (likely > l.max) {
        
        l.max <- likely
        l.cl <- zi
        l.par <- parameters
        l.af <- alf 
        l.hpar <- hyperParameters
      }
    }
    
    alf <-  McMc(updateAlfa, alf, 2)
    
    v.af <- c(v.af, alf)
    v.n.cl <- c(v.n.cl, max(zi))
    
    # see the results in real time
    if(talk == T) cat("\nIteration:",i, "Current classes:", table(zi), "Likely classes", table(l.cl),"\n")
  }
  
  numberLatentClasses <- table(factor(l.cl))
  #**********************************************************************************************
  t2 <- Sys.time()
  howMuchTime <- difftime(t2, t1)
  res <- list(l.cl, l.par,l.hpar, l.af, v.af, v.n.cl, numberLatentClasses, howMuchTime)
  names(res) <- c("likely class sequence", "likely parameters", "likely hyperpameter",
                  "likely concentration parameter", "concentration parameter sampling sequence", 
                  "number of classes sequence", "number of elements in the likely class", "calculation time")
  return(res)
}
