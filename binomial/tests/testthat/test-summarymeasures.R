context("test-summarymeasures")

test_that("test aux_mean", {

  expect_equal(aux_mean(10,0.3),3)
  expect_length(aux_mean(10, 0.3),1)
  expect_type(aux_mean(10,0.3),'double')
})

test_that("test aux_variance", {

  expect_equal(aux_variance(10,0.3),2.1)
  expect_length(aux_variance(10, 0.3),1)
  expect_type(aux_variance(10,0.3),'double')
})

test_that("test aux_mode", {

  expect_equal(aux_mode(10,0.3),3)
  expect_length(aux_mode(10, 0.3),1)
  expect_type(aux_mode(10,0.3),'double')
})

test_that("test aux_skewness", {

  expect_equal(aux_skewness(6,0.5),0)
  expect_length(aux_skewness(10, 0.3),1)
  expect_type(aux_skewness(10,0.3),'double')
})

test_that("test aux_kurtosis", {

  expect_equal(aux_kurtosis(10,0.5),-0.2)
  expect_length(aux_kurtosis(10, 0.3),1)
  expect_type(aux_kurtosis(10,0.3),'double')
})
