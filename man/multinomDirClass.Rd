\name{multinomDirClass}
\alias{multinomDirClass}

\title{
Nonparametric Multinomial Mixture Modeling 
}
\description{

Nonparametric Dirichlet-Multinomial classification to rows of a data matrix without specifying the number of classes (nonparametric), is also a random variable.
}
\usage{
multinomDirClass(measures, n.it = 10000, n.B.in = 3000, zi = rep(1, N),
alf = 3, seed = 2308.2202, talk = T)
}

\arguments{
  \item{measures}{

matrix(), of data, each row as multinomial vector, can be the output of the function codinData()
}
  \item{n.it}{

numeric(1), number of iterations
}
  \item{n.B.in}{

numeric(1), number of burn-in iterations (ignored iterations)
}
  \item{zi}{

vector(), initialization of indicator variable.
}
  \item{alf}{

numeric(1), concentration parameter
}
  \item{seed}{

numeric(1), reproducibility of the results (same results with the same seed)
}
  \item{talk}{

logical, shows the classification evolution in real time, if talk is true.
}
}
\value{
An object of class list, with elements:
\item{likely class sequence}{ vector of the class indicators sequence
}
\item{likely parameters}{ list of parameters of each class
}
\item{likely hyperpameter}{ parameter of the hyperprior
}
\item{likely concentration parameter}{ most likely concentration parameter
}
\item{Sampling sequence of concentration parameters}{ if you want to see the posterior alfa distribution
}
\item{sequence of class numbers}{ if you want to see the posterior class number distribution
}
\item{number of elements in the likely class}{ counts at each combination of factor levels within likely class sequence
}
\item{calculation time}{ the duration of calculates
}
}
\author{

Azeddine Frimane.\cr
Laboratory of renewable Energies and Environment (LR2E),\cr
Faculty of Science, IBN TOFAIL University, Morocco.\cr
email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}
\examples{
# load needed library
library("SolMultinomClass")

# load data
data("OregonUData") 

# calculate the extraterrestrial radiation for the given site
mat2 <- rayExt(phi = 43.12, lg = -121.06, tStep = 300) # tStep = 5 minutes

#In accordance with considered data, 12 hours of measurements by 5 min, from 6h to 18h.
mat2 <- mat2[,73:216] # 

# now, coding the data as multinomial distribution of the clearness index (mat2/mat1)
mat <- codingData(OregonUData, mat2, 8) # 8 bins

# finally, carry out the classification, number of iterations must be large (15000 only fo example)
classification <- multinomDirClass(measures = mat, n.it = 15000, n.B.in = 3000)

# save the classification results to a file
save(classification, file = "classificationResults.RData")
}