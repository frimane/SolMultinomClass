\name{sizing}
\alias{sizing}

\title{
  sizing stand-alone PV systems based-reliability
}
\description{
  This method consists of a detailed statistical simulation of the PV sys-
  tem behavior, in order to determine the loss of load probability corresponding
  to pairs of generator capacity (ca) and accumulator capacity values (cs).
  ca is defined as the ratio between the mean PV-array energy production 
  and the mean load energy demand. 
  cs is defined as the maximum energy that can be taken out from the accumulator divided by the mean load energy demand.
  For more information see the reference below.
}
\usage{
  sizing(meas, margC = rev(seq(0.5, 9, 0.01)), margA = seq(0.1, 2.5, 0.01), LLP = 0.05)
}

\arguments{
  \item{meas}{
    vector of daily global solar radiation
  }
  \item{margC}{
    a numerical vector containing the range of accumulator capacity values.
  }
  \item{margA}{
    a numerical vector containing the range of generator capacity values.
  }
  \item{LLP}{
    The desired loss of load probability.
  }
}

\value{
  The function plot the curve of the iso-reliability desired and provide also 
  an object of class matrix of two rows represents each point in the ca −cs plane (each ponit 
  represents a size of the PV system). 
}

\References{
  Lorenzo, E., 2003. Energy collected and delivered by PV modules. Wiley. URL: http://onlinelibrary.wiley.com/book/10.1002/9780470974704, doi:https://doi.org/10.1002/9780470974704.
}

\author{
  Azeddine Frimane.\cr
  Laboratory of renewable Energies and Environment (LR2E),\cr
  Faculty of Science, IBN TOFAIL University, Morocco.\cr
  email: Azeddine.frimane@uit.ac.ma; Azeddine.frimane@yahoo.com
}
