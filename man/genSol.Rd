\name{genSol}
\alias{genSol}

\title{
  Generating synthetic daily clearness index sequences
}
\description{
  Coupling between the sequence of classes resulting from the Dirichlet multinomial 
  mixture classification and an hidden Markov model. This allows generating daily clearness
  index sequences capable of reproducing the same long-term statistical characteristics
  as those measured.
}
\usage{
  genSol(nbr, seqStats, moy, variance)
}

\arguments{
  \item{nbr}{
    number of days desired.
  }
  \item{seqStats}{
    numerical vector containing the result sequence of clearness index classes from the classification method multinomDirClass.
  }
  \item{moy}{
    matrix containg the mean of each class. Each row represents a typical day
  }
  \item{variance}{
    list of matrices representing the variance of each class.
  }
}

\value{
  an object of class matrix, each line represents a sample daily clearness index
}

\author{
  Azeddine Frimane.\cr
  Laboratory of renewable Energies and Environment (LR2E),\cr
  Faculty of Science, IBN TOFAIL University, Morocco.\cr
  email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}
