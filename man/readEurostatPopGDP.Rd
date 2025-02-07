% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readEurostatPopGDP.R
\name{readEurostatPopGDP}
\alias{readEurostatPopGDP}
\title{Read Eurostat historical emissions}
\usage{
readEurostatPopGDP(subtype)
}
\arguments{
\item{subtype}{emissions for original eurostat emissions split, MACCemi for MACC historical emissions, or
sectorEmi for sector specific emissions}
}
\value{
magpie object of Eurostat historical emissions (MtCO2)
}
\description{
Read-in Eurostat historical emissions csv files as magclass object
}
\examples{
\dontrun{
readSource("EurostatPopGDP", subtype = "population")
}
}
\seealso{
\code{\link[madrat:readSource]{madrat::readSource()}}

Other "Past" population functions: 
\code{\link{readMissingIslands}()},
\code{\link{readUN_PopDiv}()},
\code{\link{readWDI}()}

Other "Future" population functions: 
\code{\link{readPEAP}()},
\code{\link{readPopulationTWN}()}

Other "Past" GDP functions: 
\code{\link{readMissingIslands}()},
\code{\link{readWDI}()}

Other Eurostat functions: 
\code{\link{convertEurostatPopGDP}()}
}
\concept{"Future" population functions}
\concept{"Past" GDP functions}
\concept{"Past" population functions}
\concept{Eurostat functions}
