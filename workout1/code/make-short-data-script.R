#title: make-shots-data-script.R
#description: create a csv data file shots-data.csv that will contain the required variables to be used in the visualization phase.
#input(s): five raw data CSV files,andre-iguodala.csv,draymond-green.csv,kevin-durant.cs,,klay-thompson.csv,stephen-curry.csv.
#output(s): shots-data.csv

col_types = c("character", "character", "integer","integer","integer","integer","character","factor","factor","integer","character","integer","integer")

getwd()
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/andre-iguodala.csv", "../data/andre-iguodala.csv")
iguodala <- read.csv("../data/andre-iguodala.csv", header = TRUE,stringsAsFactors = FALSE,colClasses = col_types)
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/draymond-green.csv", "../data/draymond-green.csv")
green <- read.csv("../data/draymond-green.csv", header = TRUE,stringsAsFactors = FALSE,colClasses = col_types)
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/kevin-durant.csv", "../data/kevin-durant.csv")
durant <- read.csv("../data/kevin-durant.csv", header = TRUE,stringsAsFactors = FALSE,colClasses = col_types)
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/klay-thompson.csv", "../data/klay-thompson.csv")
thompsont <- read.csv("../data/klay-thompson.csv", header = TRUE,stringsAsFactors = FALSE,colClasses = col_types)
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/stephen-curry.csv", "../data/stephen-curry.csv")
curry <- read.csv("../data/stephen-curry.csv", header = TRUE,stringsAsFactors = FALSE,colClasses = col_types)

iguodala$name = 'Andre Iguodala'
green$name = 'Graymond Green'
durant$name = 'Kevin Durant'
thompsont$name = 'Klay Thompson'
curry$name = 'Stephen Curry'

iguodala[iguodala$shot_made_flag == 'n',]$shot_made_flag = "shot_no"
iguodala[iguodala$shot_made_flag == 'y',]$shot_made_flag = "shot_yes"
green[green$shot_made_flag == 'n',]$shot_made_flag = "shot_no"
green[green$shot_made_flag == 'y',]$shot_made_flag = "shot_yes"
durant[durant$shot_made_flag == 'n',]$shot_made_flag = "shot_no"
durant[durant$shot_made_flag == 'y',]$shot_made_flag = "shot_yes"
thompsont[thompsont$shot_made_flag == 'n',]$shot_made_flag = "shot_no"
thompsont[thompsont$shot_made_flag == 'y',]$shot_made_flag = "shot_yes"
curry[curry$shot_made_flag == 'n',]$shot_made_flag = "shot_no"
curry[curry$shot_made_flag == 'y',]$shot_made_flag = "shot_yes"

iguodala$minute = (iguodala$period *12) - iguodala$minutes_remaining
green$minute = (green$period *12) - green$minutes_remaining
durant$minute = (durant$period *12) - durant$minutes_remaining
thompsont$minute = (thompsont$period *12 )- thompsont$minutes_remaining
curry$minute = (curry$period *12 )- curry$minutes_remaining

sink(file="../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
sink(file="../output/draymond-green-summary.txt")
summary(green)
sink()
sink(file="../output/kevin-durant-summary.txt")
summary(durant)
sink()
sink(file="../output/klay-thompsona-summary.txt")
summary(thompsont)
sink()
sink(file="../output/stephen-curry-summary.txt")
summary(curry)
sink()
getwd()
a <- rbind(iguodala,green,durant,thompsont,curry)
write.csv(
  x = a,
  file = '../data/shots-data.csv' 
)
sink(file = "../output/shots-data-summary.txt")
summary(a)
sink()
