context("test-checkers")

test_that("test check_prob", {

  expect_true(check_prob(0.6))
  expect_type(check_prob(0.2),'logical')
  expect_error(check_prob(2))
})


test_that("test check_trials", {

  expect_true(check_trials(5))
  expect_error(check_trials(0.2))
  expect_error(check_trials(-7))
})

test_that("test check_success", {

  expect_true(check_success(5,6))
  expect_error(check_success(8, 6))
  expect_error(check_success(0.2,6))
  expect_error(check_success(-7,6))
})


