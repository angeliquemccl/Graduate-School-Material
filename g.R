probability_fair <- dbinom(11, 20, 0.50)
probability_biased <- dbinom(11, 20, 0.75)

probability_fair
probability_biased

#calculate the posterior probaility of a fair coin

probability_fair/ (probability_fair + probability_biased)

# Pobaility that 14/20 heads is fair

dbinom(14,20,0.5)/(dbinom(14,20,0.50) +dbinom(14,20,0.75))

dbinom(18,20,0.5)/(dbinom(18,20,0.50) +dbinom(18,20,0.75))
#Prob that 17/20 is fair
probability_17_fair <- dbinom(17, 20, .5)
probability_17_fair <- dbinom(17, 20, .75)

# prob that the coin is fair given a 92% prior prob
(probability_17_fair*.92)/(probability_17_fair*.92 + probability_17_fair *.08)

#1000,000 draws from Binomial(1000, 0.2)
binom_sample <- rbinom(100000, 1000, 0.20)
binom_sample

#100,000 from normal distribution use rnorm <- normal sample
normal_sample <- rnorm(100000, 1000*0.2, sqrt(1000*0.2*(1-0.2)))
normal_sample

#compare the two distributions
hist(binom_sample)
hist(normal_sample)

#use binom sample to calculate prob. of 190 heads or less
mean(binom_sample <= 190)

#use normal sample to calculate prob. of 190 heads or less
mean(normal_sample <= 190)

#calculate pbinom of binomial distribution
pbinom(190, 1000, 0.2)

#calculate onorm of normal distribution
pnorm(190, 200, sqrt(160))
