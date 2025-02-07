% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readSSP.R
\name{readSSP}
\alias{readSSP}
\title{Read SSP}
\usage{
readSSP(subtype)
}
\arguments{
\item{subtype}{A string, either "all", "gdp", "pop", "urb", "pop2018Update",
"lab2018Update" or "ratioPM".}
}
\value{
Magpie object of the SSP data
}
\description{
Read-in an SSP data csv.zip file as magclass object
}
\examples{
\dontrun{
readSource("SSP", subtype = "gdp")
}

}
\seealso{
\code{\link[madrat:readSource]{madrat::readSource()}}
}
