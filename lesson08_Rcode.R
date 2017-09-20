#' =======================================
#' Working with the HELP dataset
#' 
#' Bivariate Stats
#' 
#' Melinda Higgins, PhD
#' dated 09/19/2017
#' =======================================

library(dplyr)
library(tidyverse)

# The *.Rdata file can be downloaded from the SASR website
# https://nhorton.people.amherst.edu/sasr2/datasets.php 
#
# download the dataset and put it in your working directory

# load the dataset help.Rdata
load("help.Rdata")

# list variables in HELP dataset
names(helpdata)

# let's look at age, female, racegrp, cesd, pcs and mcs.
helpset1 <- helpdata %>%
  select(age, female, racegrp, cesd, pcs, mcs)

# simple summary
summary(helpset1)

# let's make female a factor
# with appropriate labels and levels defined
helpset1$femaleF <- factor(helpset1$female,
                           levels=c(0,1),
                           labels=c("male","female"))

# check
table(helpset1$female)
table(helpset1$femaleF)

# let's merge hispanic/other together for race
helpset1$race3[helpset1$racegrp == "black"] <- "Black"
helpset1$race3[helpset1$racegrp == "white"] <- "White"
helpset1$race3[helpset1$racegrp == "hispanic"] <- "Hisp/Other"
helpset1$race3[helpset1$racegrp == "other"] <- "Hisp/Other"

# check - use head() to see rows 50-60
# these rows have all 4 races 
helpset1[50:60,c("racegrp", "race3")]

# =======================================
# continuous - continuous
# =======================================
# 1st - are these normal?

ggplot(helpset1, aes(x=age)) + 
  geom_histogram(aes(y=..density..), 
                 binwidth=5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(title="Histogram of Age")

qqnorm(helpset1$age)
qqline(helpset1$age)

library(car)
car::qqPlot(helpset1$age)

library(ggpubr)
ggqqplot(helpset1$age)

# Shapiro-Wilk's test of normality - better test
shapiro.test(helpset1$age)

# Kolmogorov_Smirnov test of normality
ks.test(helpset1$age, "pnorm")

# get skewness and kurtosis
library(e1071)
e1071::skewness(helpset1$age)
e1071::kurtosis(helpset1$age)

# skip
#library(moments)
#moments::skewness(helpset1$age)
#moments::kurtosis(helpset1$age)

#skip
#library(propagate)
#propagate::skewness(helpset1$age)
#propagate::kurtosis(helpset1$age)

library(psych)
psych::skew(helpset1$age)
psych::kurtosi(helpset1$age)
psych::mardia(helpset1$age)
psych::describe(helpset1$age)

# look at cesd, pcs and mcs
ggplot(helpset1, aes(x=cesd)) + 
  geom_histogram(aes(y=..density..), 
                 binwidth=5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(title="Histogram of CESD")

qqnorm(helpset1$cesd,
       main="QQ Plot of CESD")
qqline(helpset1$cesd)

psych::describe(helpset1$cesd)
shapiro.test(helpset1$cesd)

ggplot(helpset1, aes(x=pcs)) + 
  geom_histogram(aes(y=..density..), 
                 binwidth=5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(title="Histogram of PCS")

qqnorm(helpset1$pcs,
       main="QQ Plot of PCS")
qqline(helpset1$pcs)

psych::describe(helpset1$pcs)
shapiro.test(helpset1$pcs)

ggplot(helpset1, aes(x=mcs)) + 
  geom_histogram(aes(y=..density..), 
                 binwidth=5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(title="Histogram of MCS")

qqnorm(helpset1$mcs,
       main="QQ Plot of MCS")
qqline(helpset1$mcs)

psych::describe(helpset1$mcs)
shapiro.test(helpset1$mcs)

library(pastecs)
vars <- c("age","cesd","pcs","mcs")
options(scipen=100)
options(digits=3)
stat.desc(helpset1[,vars], 
          basic=TRUE,
          norm=TRUE)

# we can use knitr::kable()
# with rmarkdown to get a nice table
stat.table <- stat.desc(helpset1[,vars], 
                        basic=TRUE,
                        norm=TRUE)
knitr::kable(stat.table,
             digits=3,
             caption="Descriptive Stats for Numeric Vars")

# =======================================
# continuous - continuous
# =======================================
# parametric Pearson's R correlation
# non-parametric Spearman's rho
# non-parametric Kendall's tau - good for rank ties

cor(helpset1[,vars],
    method="pearson")
cor(helpset1[,vars],
    method="spearman")
cor(helpset1[,vars],
    method="kendall")

# can also use the corr.test() in the psych
# package to get the p-values, t-tests,
# and confidence intervals, in addition to
# the correlations
psych::corr.test(helpset1[,vars],
                 method="pearson")

# save the results
pc <- psych::corr.test(helpset1[,vars],
                       method="pearson")
# look at correlations
pc$r

# t-test for each correlation
pc$t

# p-value of each t-test for correlation
pc$p

# confidence intervals for each pair
# removes the diagonal values and tests
pc$ci

# also look at spearmans rho
pc <- psych::corr.test(helpset1[,vars],
                       method="spearman")
pc$ci

# =======================================
# continuous with 2-group categorical
# =======================================
# this is basically a t-test
vars <- c("female","age","cesd")
pc <- psych::corr.test(helpset1[,vars],
                       method="pearson")
pc$ci

pc$t

# compare to running a t-test
options(digits=8)
t.test(age ~ female, helpset1)
t.test(cesd ~ female, helpset1)

# non-parametric 2-group tests
# Mann Whitney U test
wilcox.test(age ~ female, helpset1)
wilcox.test(cesd ~ female, helpset1)

# =======================================
# categorical - categorical
# =======================================
library(gmodels)

# basic table - formatted like SAS
CrossTable(helpset1$race3, helpset1$female)

# remove row%, total%, chisq contribution
CrossTable(helpset1$race3, helpset1$female,
           expected=TRUE,
           prop.r=FALSE,
           prop.t=FALSE,
           prop.chisq=FALSE)

# add chi-square test of independence
# and Fisher's Exact Test
# learn more help(fisher.test)
CrossTable(helpset1$race3, helpset1$female,
           expected=TRUE,
           prop.r=FALSE,
           prop.t=FALSE,
           prop.chisq=FALSE,
           chisq=TRUE,
           fisher=TRUE)
