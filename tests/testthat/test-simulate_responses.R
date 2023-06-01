
test_that("sim_mc_single produces the right data", {
  s <- read_survey("minimal-survey.yml")
  
  q <- s[[1]]$question
  d <- sim_mc_single(q, 1000)

  expect_true(inherits(d, "factor"))
  expect_equal(levels(d), c("Strawberry", "Chocolate", "Vanilla", "Other"))
  expect_true(mean(is.na(d)) > 0 && mean(is.na(d)) < .1)
})

test_that("sim_number produces the right data", {
  s <- read_survey("minimal-survey.yml")
  q <- s[[2]]$question
  d <- sim_number(q, 1000)

  expect_true(inherits(d, "numeric"))
  expect_true(max(na.omit(d)) < q$max + 600)
  expect_true(mean(is.na(d)) > .15 && mean(is.na(d)) < .25)
})