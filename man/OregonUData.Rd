\name{OregonUData}
\alias{OregonUData}
\docType{data}
\title{
measured global horizontal solar radiation
}
\description{
files containing 5-minute global horizontal solar radiation data for a single year 2015
}
\usage{data("OregonUData")}
\details{
An object of class data, each line represents one day 
and each column represents one time-step
}
\source{
University of Oregon, Solar Radiation Monitoring Laboratory,\cr
URL http://solardat.uoregon.edu, accessed November 25, 2017.
}
\examples{
# load data
data("OregonUData")

# plot a random day example
plot(1:144, OregonUData[sample(1:365, 1), ], type = "l") 
}
\keyword{datasets}
