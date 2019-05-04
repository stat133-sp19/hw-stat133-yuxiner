context("test-binomial")

test_that("test bin_choosec", {

  expect_equal(bin_choose(5,2), 10)
  expect_error(bin_choose(3,8))
  expect_equal(bin_choose(5, 1:3), c(5,10,10))
})

test_that("test bin_probability", {

  expect_equal(bin_probability(3,8,0.5), 0.21875)
  expect_error(bin_probability(8,2,0.5))
  expect_equal(bin_probability(0:2, 3, 0.5), c(0.125,0.375,0.375))
})

test_that("test bin_distribution", {

  expect_is(bin_distribution(6,0.5), "bindis")
  expect_length(bin_distribution(6,0.5), 2)
  expect_equal(bin_distribution(6,0.5)$success, 0:6)
})

test_that("test bin_cumulative", {

  expect_is(bin_cumulative(6,0.5), "bincum")
  expect_length(bin_cumulative(6,0.5), 3)
  expect_equal(bin_cumulative(6,0.5)$cumulative[7], 1)
})


