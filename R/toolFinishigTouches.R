# Apply finishig touches to the combined object, as found in calcGDP, calcGDPpc and calcPopulation
toolFinishingTouches <- function(x,
                                 extension2150 = "none",
                                 FiveYearSteps = FALSE,
                                 naming = "indicator_scenario",
                                 unit = "none",
                                 constructUnit = "none",
                                 average2020 = FALSE) {

  x <- toolInterpolateAndExtrapolate(x)

  # Extend to 2150, if opted for
  x <- toolExtend2150(x, extension2150)

  if (constructUnit != unit) {
    # Convert using regional averages for now.
    regmap <- toolGetMapping("regionmappingH12.csv") %>%
      tibble::as_tibble() %>%
      dplyr::select("iso3c" = .data$CountryCode, "region" = .data$RegionCode)

    x <- GDPuc::convertGDP(x, constructUnit, unit, with_regions = regmap, replace_NAs = "regional_average")
  }

  # For REMIND, the concensus is to avergae the 2020 value so as to dampen the effect of the COVID shock. (The
  # reasoning being that REMIND uses 5-year time steps, and that the year-in-itself should represent the 2,5 years
  # before and after.)
  # The dampening is supposed to take place on GDP. So for GDP per capita in 2020 to be consitstent with the dampened
  # GDP, it has to calculated from GDP and population. (In other words we can't just use the same formula as for GDP,
  # sind it would lead to inconsistency at the end.) This is very hacky... A prettier solution should be developed in
  # the future. For now we assume GDP is filled with -MI!
  if (average2020) {
    if (all(grepl("^gdppc_", getNames(x)))) {
      helper <- calcOutput("GDP", unit = unit, naming = "scenario", aggregate = FALSE)[, 2020, ] /
        calcOutput("Population", naming = "scenario", aggregate = FALSE)[, 2020, ]
      getNames(helper) <- paste0("gdppc_", getNames(helper))
      helper <- helper[, , getNames(x)]
      getSets(helper) <- getSets(x)
      x[, 2020, ] <- helper
    } else {
      xNew2020 <- (x[, 2018, ] + x[, 2019, ] + x[, 2020, ] + x[, 2021, ] + x[, 2022, ]) / 5
      getYears(xNew2020) <- 2020
      getSets(xNew2020) <- getSets(x)
      x[, 2020, ] <- xNew2020
    }
  }


  # LONGTERM: Historically this was done with magpiesets::findest("time"), which returned
  # seq(1965, 2150, 5).. so that is what is being done here. But this is confusing.
  # Is it even necessary? Why not use the 'years' argument of calcOutput...
  # Return only 5-year time steps, if opted for
  if (FiveYearSteps) {
    x <- x[, getYears(x, as.integer = TRUE) %% 5 == 0, ]
    # This operation used to be done using magpiesets::findset("time"), which for some reason
    # doesn't include 1960. So it's taken out as well.
    x <- x[, getYears(x, as.integer = TRUE) != 1960, ]
  }

  # Order by names
  x <- x[, , order(getNames(x))]

  # Split indicator from scenario
  if (naming == "indicator.scenario") {
    getNames(x) <- sub("_",  ".", getNames(x))
    getSets(x) <- c(getSets(x)[1], getSets(x)[2], "indicator", "scenario")
  }
  # Drop indicator
  if (naming == "scenario") {
    getNames(x) <- sub(".*?_",  "", getNames(x))
  }

  x
}
