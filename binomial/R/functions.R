
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#1.1) Private Checker Functions
# Description: test if an input prob is a valid probability value
# Inputs
#   prob: the probability of success on each trial
# Output
#   if an input prob is a valid
check_prob <- function(prob) {
  if (prob < 0 | prob > 1){
    stop('\ninvalid prob value')
  }
  if (length(prob) > 1){
    stop('\ninvalid prob value')
  }
  TRUE
}
# Description: test if an input trials is a valid value for number of trials
# Inputs
#   trials: is the number of (fixed) trials
# Output
#   if an input trials is a valid value
check_trials <- function(trials) {
  if (trials <= 0){
    stop('\ninvalid trials value')
  }
  if (!(all.equal(trials, as.integer(trials)))) {
    stop('\ninvalid trials value')
  }
  if (length(trials) > 1){
    stop('\ninvalid trials value')
  }
  TRUE
}
# Description: test if an input success is a valid value for number of successes
# Inputs
#   trials:is the number of (fixed) trials
#   success: represents the number of successes out of n trials
# Output
#   if an input success is a valid value
check_success <- function(success,trials) {
  if (any(success < 0)) {
    stop('\ninvalid success value')
  }
  if (!(all.equal(success, as.integer(success)))) {
    stop('\ninvalid success value')
  }
  if (any(success > trials)) {
    stop('\nsuccess cannot be greater than trials')
  }
  TRUE
}
#1.2) Private Auxiliary Functions
# Description: The expected value or mean of a binomial distribution
# Inputs
#   trials: is the number of (fixed) trials
#   prob: the probability of success on each trial
# Output
#   the expected number of successes in trials
aux_mean <- function(trials, prob) {
  trials * prob
}
# Description: The  variance of a binomial distribution
# Inputs
#   trials: is the number of (fixed) trials
#   prob: the probability of success on each trial
# Output
#   the variance number
aux_variance <- function(trials, prob) {
  trials * prob *(1 - prob)
}
# Description: the most likely number of success in independent trials with probability prob of success on each trial
# Inputs
#   trials: is the number of (fixed) trials
#   prob: the probability of success on each trial
# Output
#   the integer number of success
aux_mode <- function(trials, prob) {
  floor(trials * prob + prob)
}
# Description: the asymmetry of the probability distribution of a random variable about its mean
# Inputs
#   trials: is the number of (fixed) trials
#   prob: the probability of success on each trial
# Output
#   the skewness of a binomial random variable
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}
# Description: the “tailedness” of the probability distribution of a random variable
# Inputs
#   trials: is the number of (fixed) trials
#   prob: the probability of success on each trial
# Output
#   the kurtosis of a binomial random variable
aux_kurtosis <- function(trials, prob) {
  (1 - 6 * prob * (1 - prob))/(trials * prob *(1 - prob))
}


#1.3) Function bin_choose()
#' @title bin_choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param k number of success
#' @param n number of trials
#' @return the combinations "n choose k
#' @export
#' @example bin_choose(n = 5, k = 2)

bin_choose <- function(n,k){
  if (any(k > n)) {
    stop("\nk cannot be greater than n")
  }
  factorial(n) / (factorial(k) * factorial(n - k))
}




#1.4) Function bin_probability()
#' @title bin_probability
#' @description finding the probability of getting the number of successs in trials with a probability of success on each trial
#' @param success number of success
#' @param trials number of trials
#' @param prob the probability of success on each trial
#' @return number of probability
#' @export
#' @example
#' bin_probability(success = 2, trials = 5, prob = 0.5)

bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success = success,trials = trials)
  a <- bin_choose(n = trials, k = success)
  a * (prob ^ success) * ((1 - prob) ^ (trials - success))
}


#1.5) Function bin_distribution()
#' @title bin_distribution
#' @description binomial probability distribution
#' @param trials number of trials
#' @param prob the probability of success on each trial
#' @return an object of class \code{"bindis"}
#' @export
#' @example
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  success = 0:trials
  probability = bin_probability(success = success ,trials = trials, prob = prob)
  a <- data.frame(
    success = success,
    probability = probability
  )
  class(a) <- c("bindis","data.frame")
  print(a)
}




#' @export
plot.bindis <- function(x) {
  barplot(x$probability,
          xlab = 'success',
          ylab = "probability",
          names.arg = x$success)
}


#1.6) Function bin_cumulative()
#' @title bin_cumulative
#' @description binomial cumulative distribution
#' @param trials the number of the trials
#' @param prob the probability of success on each trial
#' @return an object of class \code{"bindcum"}
#' @export
#' @examples
#' bin_cumulative(trials = 10, prob = 0.3)
bin_cumulative <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  success = 0:trials
  probability = bin_probability(success = success ,trials = trials, prob = prob)
  a <- data.frame(
    success = success,
    probability = probability,
    cumulative = cumsum(probability)
  )
  class(a) <- c("bincum","data.frame")
  print(a)
}





#' @export
plot.bincum <- function(x) {
  plot(x$success,x$cumulative,
       xlab = "success",
       ylab = "probability")
  lines(x$success, x$cumulative)
}


#1.7) Function bin_variable()
#' @title bin_variable
#' @description Create an object of class \code{"binvar"}
#' @param trials the number of the trials
#' @param prob the probability of success on each trial
#' @return an object of class \code{"binvar"}
#' @export
#' @examples
#' bin_variable(trials = 10, prob = 0.3)
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  a <- list(trials = trials, prob = prob)
  class(a) <- "binvar"
  a
}


#' @export
print.binvar <- function(x) {
  cat("\n\"Binomial variable\"\n\n")
  cat("Paramaters")
  cat(sprintf("\n- number of trials: %s", x$trials))
  cat(sprintf("\n- prob of success: %s", x$prob))
  invisible(x)
}

#' @export
summary.binvar <- function(x) {
  a <- list(trials = x$trials,
            prob = x$prob,
            mean = aux_mean(trials = x$trials, prob = x$prob),
            variance = aux_variance(trials = x$trials,prob = x$prob),
            mode = aux_mode(trials = x$trials,prob = x$prob),
            skewness = aux_skewness(trials = x$trials,prob = x$prob),
            kurtosis = aux_kurtosis(trials = x$trials,prob = x$prob))
  class(a) <- "summary.binvar"
  a
}

#' @export
print.summary.binvar <- function(x) {
  cat("\n\"Summary Binomial\"\n\n")
  cat("Paramaters")
  cat(sprintf("\n- number of trials: %s", x$trials))
  cat(sprintf("\n- prob of success: %s", x$prob))
  cat("\n\nMeasures")
  cat(sprintf("\n- mean\t: %s",x$mean))
  cat(sprintf("\n- variance\t: %s",x$variance))
  cat(sprintf("\n- mode\t: %s",x$mode))
  cat(sprintf("\n- skewness\t: %s",x$skeness))
  cat(sprintf("\n- kurtosis\t: %s",x$kurtosis))
}


#1.8) Functions of measures
#' @title bin_mean
#' @description  the mean of a binominal distribution
#' @param trials the number of trials
#' @param prob the probability of success on each trial
#' @return the number of mean
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials,prob)
}
#' @title bin_variance
#' @description the variance of a binominal distribution
#' @param trials the number of trials
#' @param prob the probability of success each trial
#' @return the number of variance
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials,prob)
}

#' @title bin_mode
#' @description the mode of a binominal distribution
#' @param trials the number of trials
#' @param prob the probability of success each trial
#' @return the number of mode
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials,prob)
}

#' @title bin_skewness
#' @description the skewness of a binominal distribution
#' @param trials the number of trials
#' @param prob the probability of success each trial
#' @return the number of skewness
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials,prob)
}

#' @title bin_kurtosis
#' @description the kurtosis of a binominal distribution
#' @param trials the number of trials
#' @param prob the probability of success each time
#' @return the number of kurtosis
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials,prob)
}

