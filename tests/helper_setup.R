# Test fixture: loads constants + code under test WITHOUT global.R
# (global.R sources utils_dependencies.R, which installs packages).
suppressPackageStartupMessages({
  library(shiny); library(shinyjs); library(dplyr); library(tidyr)
  library(ggplot2); library(deSolve); library(RcppRoll)
})
root <- normalizePath(file.path(dirname(sys.frame(1)$ofile %||% "."), ".."), mustWork = FALSE)
