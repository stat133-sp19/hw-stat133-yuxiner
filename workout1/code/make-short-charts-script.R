#title:make shot charts script
#description: creation of shot charts
#input(s): andre-iguodala.csv,draymond-green.csv,kevin-durant.cs,,klay-thompson.csv,stephen-curry.csv.shots-data.csv
#output(s): shot charts for five players and gsw
getwd()
setwd('/Users/yuxiner/Documents/stat 133/workout01/code')
download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg" , "../images/nba-court.jpg")
install.packages(c( "jpeg" ,"grid","ggplot2"))
library(jpeg)
library(grid)
library(ggplot2)
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
readJPEG(court_file),
width = unit(1, "npc"),
height = unit(1, "npc"))
thompsont_scatterplot <- ggplot(data = thompsont ) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

thompsont_shot_chart <- ggplot(data = thompsont) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
pdf(file = "../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
thompsont_shot_chart
dev.off()

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
pdf(file = "../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
iguodala_shot_chart
dev.off()

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
pdf(file= "../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
green_shot_chart
dev.off()

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
pdf(file= "../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
durant_shot_chart
dev.off()

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
pdf(file= "../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
curry_shot_chart
dev.off()

pdf(file= "../images/gsw-shot-charts.pdf", width=8, height=7)
gsw_shot_char <- ggplot(data = a) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~name)+
  theme_minimal()
gsw_shot_char
dev.off()

png(file= "../images/gsw-shot-charts.png", width=8, height=7,units="in", res=200)
gsw_shot_char <- ggplot(data = a) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~name)+
  theme_minimal()
gsw_shot_char
dev.off()

