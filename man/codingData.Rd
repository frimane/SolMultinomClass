\name{codingData}
\alias{codingData}

\title{
Clearness index Multinomial distribution
}
\description{
daily clearness index is coded as a vector of integers called occupation numbers. 
}
\usage{
codingData(meas, Emeas, nBin)
}

\arguments{
  \item{meas}{
 matrix of global horizontal solar radiation
}
  \item{Emeas}{
 matrix of extraterrestrial radiation for same given site of meas (output of rayExt() function)
}
  \item{nBin}{
number of bins wanted
}
}

\value{
an object of class matrix, each line represents one daily multinomial 
distribution and each column represents one bin
}

\author{
Azeddine Frimane.\cr
Laboratory of renewable Energies and Environment (LR2E),\cr
Faculty of Science, IBN TOFAIL University, Morocco.\cr
email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}

\examples{
# see the example in multinomDirClass function 
}
