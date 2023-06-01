test_that("read_survey constructs a survey class object", {
  svy <- read_survey("minimal-survey.yml")
  expect_equal(attr(svy, "name"), "Minimal test survey")
  expect_equal(svy[[1]]$question$var, "fave_icecream")
})
