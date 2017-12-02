\name{rayExt}
\alias{rayExt}
\title{
calculation of extraterrestrial radiation
}
\description{
function that calculates the extraterstrial radiation knowing the latitude, 
longitude and the time-step wanted
}
\usage{
rayExt(phi = 0, lg = 0, tStep = 300)
}
\arguments{
  \item{phi}{
latitude of the considered site
}
  \item{lg}{
longitude of the considered site
}
  \item{tStep}{
time-step wanted, gived by second (example: for 5min;  tStep = 300)
}
}
\value{
An object of class matrix, each line represents one day 
and each column represents one time-step
}

\author{
Azeddine Frimane.\cr
Laboratory of renewable Energies and Environment (LR2E),\cr
Faculty of Science, IBN TOFAIL University, Morocco.\cr
email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}

\examples{
# calculate the extraterrestrial radiation for a given site (latitude = 15, longitude = 15)
# with a time-step of 1 minute
matr <- rayExt(phi = 15, lg = 15, tStep = 60) 

# plot a random day example
plot(1:(60*24), matr[sample(1:366, 1), ], type = "l")
}
