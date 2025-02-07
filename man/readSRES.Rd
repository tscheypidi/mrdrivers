% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readSRES.R
\name{readSRES}
\alias{readSRES}
\title{Read SRES}
\usage{
readSRES(subtype)
}
\arguments{
\item{subtype}{data subtype. "pop_a1","pop_a2","pop_b1","pop_b2" or
"gdp_a1","gdp_a2","gdp_b1","gdp_b2"}
}
\value{
magpie object of the SRES data. Units are million people or USD1990
market exchange rate.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

Read-in an SRES data csv file as magclass object. Works for both population
and GDP
}
\examples{
\dontrun{
readSource("SRES", subtype = "pop_a1")} 
}
\seealso{
\code{\link[madrat:readSource]{madrat::readSource()}}
}
\keyword{internal}
