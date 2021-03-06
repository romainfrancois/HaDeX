library(testthat)
library(HaDeX)

context("calculate_confidence_limit_values in test")

dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
calc_dat <- prepare_dataset(dat,
                            in_state_first = "CD160_0.001",
                            chosen_state_first = "CD160_1",
                            out_state_first = "CD160_1440",
                            in_state_second = "CD160_HVEM_0.001",
                            chosen_state_second = "CD160_HVEM_1",
                            out_state_second = "CD160_HVEM_1440")   

test_that("class is right",
          expect_is(calculate_confidence_limit_values(calc_dat = calc_dat),
                    "numeric"))

test_that("returned value is right",
          expect_equal(calculate_confidence_limit_values(calc_dat = calc_dat),
                       c(-0.004212046, 0.004212046)))