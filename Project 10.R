#install.packages("openintro")
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("readr")


library(dplyr)
library(ggplot2)
library(openintro)
library(readr)
head(textbooks)
names(textbooks)
textbooks %>%
  mutate(course_number = course) %>%
  ggplot(aes(x = course_number, y = ucla_new)) +
  geom_point()
ggplot(data = textbooks, aes(x = amaz_new, y = ucla_new))+
  geom_point()
ggplot(data = textbooks, aes(x = amaz_new, y = ucla_new))+
  geom_point() + geom_smooth(method = "lm", se = FALSE)
lm(ucla_new ~ amaz_new, data = textbooks)

#Question 1
head(bdims)
ggplot(data = bdims, aes(x = wgt, y =hgt))+
  geom_point()

#Question 2
head(bdims)
names(bdims)
mod <-lm(wgt ~ hgt, data = bdims)
coef(mod)
summary(mod)

#Question 3
head(bdims)
mod <- lm(wgt ~ hgt, data = bdims)
mean(bdims$wgt) == mean(fitted.values(mod))
mean(residuals(mod))

#Question 4
install.packages("broom")
library(broom)
bdims_tidy <- augment(mod)
glimpse(bdims_tidy)
