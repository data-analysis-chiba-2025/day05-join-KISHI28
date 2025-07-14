library(tidyverse)
library(scales)

gap_minder <- read_csv("data_raw/gapminder.csv")

#make a plot
ggplot(
  data = gap_minder,
  mapping = aes(
    x = gdpPercap,
    y = lifeExp
  )
  ) + 
  geom_point()

#challenge
ggplot(
  data = gap_minder,
  mapping = aes(
    x = year,
    y = lifeExp
  )
) + 
  geom_point()

#add colors
ggplot(
  data = gap_minder,
  mapping = aes(
    x = year,
    y = lifeExp,
    color = continent
  )
) +
  geom_point()
#simplified version 
ggplot(
  gap_minder, 
  aes(x = year, y = lifeExp
      )
  )+ geom_point()

#line graph, add group
ggplot(
  gap_minder, 
  aes(x = year, 
      y = lifeExp,
      color = continent,
      group = country
      )  )+ 
  geom_line() +
  geom_point(color = "black")+
  ggtitle("Life expectancy change over time")

# Try to putting aesthetics somewhere else
ggplot(
  gap_minder,
  aes(
    x = year,
    y = lifeExp,
    color = continent,
    group = country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point(color = "black")+
  ggtitle("Life expectancy change over time")
#defo color of point is black.

#Scaling the gdp graph
ggplot(
  gap_minder,
  aes(
    x = gdpPercap,
    y = lifeExp,
    color = continent,
    group = country)) +
  geom_point()+
  ggtitle("Life expectancy change over time") +
  scale_x_log10()

#make a small dataset
gapminder_asia <- 
  gap_minder |>
  filter(
  country %in% c("Japan", "China", "Korea, Rep.", "Taiwan"))

#plot life ex for Asian countries
gap_minder_asia_plot <- ggplot(
  gapminder_asia,
  aes(
    x = year,
    y = lifeExp
  )
) + 
  geom_line() + 
  facet_wrap(vars(country)) + 
  labs(
    x = "Year",
    y = "Life Expectancy",
    title = "figure 1"
  )
ggsave(plot = gap_minder_asia_plot, file = "gapminder_asia.jpeg")
Saving 5.29 x 2.82 in image

