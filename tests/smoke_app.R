# Starts the app headless (without global.R's package installer) and fetches the page.
suppressPackageStartupMessages({library(shiny);library(shinyjs);library(dplyr);library(tidyr);library(ggplot2);library(deSolve);library(RcppRoll)})
options(scipen=999)
POPULATION_ARGENTINA <- 45000000; INITIAL_R0 <- 2.5; INITIAL_INCUBATION_PERIOD <- 5; INITIAL_INFECTIOUS_PERIOD <- 7
INITIAL_IFR <- 0.01; INITIAL_ICU_RATE <- 0.136; INITIAL_VENTILATOR_RATE <- 0.02; INITIAL_HOSPITAL_STAY_DAYS <- 10
INITIAL_ICU_CAPACITY <- 6000; INITIAL_VENTILATOR_AVAILABILITY <- 2000; INITIAL_HEALTHCARE_STAFF <- 10000
START_DATE <- Sys.Date(); END_DATE <- Sys.Date() + 365L
for (f in c("R/utils/utils_helpers.R","R/utils/utils_validation.R","_orig/utils_logging.R",
            list.files("R", pattern="\\.R$", full.names=TRUE), "_orig/mod_data.R")) source(f, encoding="UTF-8")
addResourcePath("img", "www/img"); addResourcePath("fonts","www/fonts")
app <- source("app.R", encoding="UTF-8")$value
shiny::runApp(app, port = 7391, launch.browser = FALSE)
