
## Overview

`"binomial"` is a minimal [R](http://www.r-project.org/) package 
that provides functions to calculate binomial distribution.

* `bin_choose()` calculates the number of combinations in which k successes can occur in n trials.
* `bin_probabilityn()` find the probability of getting the number of successs in trials with a probability
* `bin_distribution()` creates a `"bindis"` class
** `plot()` to graph a barplot to display the probability histogram of a binomial distribution object `"bindis"`.
* `bin_cumulative()` creates a `"bincum"` class
** `plot()` to graph the cumulative distribution in a object `bincum`.
* `bin_variabl()` creates a `"binvar"` class
** `summary()` method for a `"binvar"` object.


## Motivation

The package `"binomial"` is a implementation for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.


## Installation

Install the development version from GitHub via the package `"devtools"`:

```{r}
# development version from GitHub:
#install.packages("devtools") 
# install "cointoss" (without vignettes)
devtools::install_github("https://github.com/stat133-sp19/hw-stat133-yuxiner/binomial")
# install "cointoss" (with vignettes)
devtools::install_github("https://github.com/stat133-sp19/hw-stat133-yuxiner/binomial", build_vignettes = TRUE)
```


## Usage

```{r}
library(binomial)
#calculates the number of combinations in which k successes can occur in n trials
bin_choose(n = 5, k = 2)


#find the probability of getting the number of successs in trials with a probability
# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 2, trials = 5, prob = 0.5)


# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)


# plotting binomial probability distribution
dis1 <- bin_distribution(trials = 5, prob = 0.5)
plot(dis1)


# binomial cumulative distribution
bin_cumulative(trials = 5, prob = 0.5)


# plotting binomial cumulative distribution
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dis2)


#nicely print the content of an object `binvar`
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1

#get a full summary description of an object `binvar`
bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1

#measures
#The mean of a binominal distribution
bin_mean(10, 0.3)

#The variance of a binominal distribution
bin_variance(10, 0.3)

#The mode of a binominal distribution
bin_mode(10, 0.3)

#The skewness of a binominal distribution
bin_skewness(10, 0.3)

#The kurtosis of a binominal distribution
bin_kurtosis(10, 0.3)
```