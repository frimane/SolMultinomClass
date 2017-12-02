\name{dayLength}
\alias{dayLength}

\title{
calculation of the day length
}
\description{
function that calculates the day length knowing the latitude 
and number of the day during the year
}
\usage{
dayLength(nj = 1, phi = 0)
}

\arguments{
  \item{nj}{
number of the day during the year (example: for 10 february, nj = 41)
}
  \item{phi}{
latitude of the considered site
}
}
\value{
An object of class numeric(1) represents the day length.
}

\author{
Azeddine Frimane.\cr
Laboratory of renewable Energies and Environment (LR2E),\cr
Faculty of Science, IBN TOFAIL University, Morocco.\cr
email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}

\examples{
# calculate the day length by hours for a given site (latitude = 15, and day 45)
dlen <- dayLength(nj = 45, phi = 15)
dlen
}
