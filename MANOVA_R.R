# Install required package
#install.packages("mvnormtest")

# Load libraries
library(tidyverse)
library(rstatix)
library(mvnormtest)

# Read the dataset
heart <- read.csv("/home/yorgun/r_tube/Rcode/ANOVA-MANOVA/heart.csv")
View(heart)  # View the dataset

# Shapiro-Wilk test for normality
heart %>% group_by(cp) %>% 
            summarise(ShapiroResult = mshapiro_test(cbind(chol, thalach))$p.value)

# Identify outliers
identify_outliers(heart["chol"]) # Take as a dataframe
identify_outliers(heart["thalach"])

# Filter outliers
heart <- heart %>% filter(chol < 394 & thalach > 71)

# Shapiro-Wilk test after outlier removal
heart %>% group_by(cp) %>% 
            summarise(ShapiroResult = mshapiro_test(cbind(chol, thalach))$p.value)

# Multivariate homogeneity of variances tests for two dependent variables
library(heplots)
bartlettTests(y = heart[c("chol", "thalach")], group = heart$cp)
leveneTests(y = heart[c("chol", "thalach")], group = heart$cp)
leveneTest(heart$chol, heart$cp)

# Box's M test for covariance matrices homogeneity
box_m(heart[c("chol", "thalach")], group = heart$cp)

# MANOVA
library(car)
model <- manova(cbind(chol, thalach) ~ cp, data = heart)
summary(model)

# Post hoc tests
grouped_heart <- heart %>% gather(key = "variable", value = "values", thalach, chol) %>%
            group_by(variable)

# Welch ANOVA test
grouped_heart %>% convert_as_factor(cp) %>%
                welch_anova_test(values ~ cp)

# TukeyHSD Test
grouped_heart %>% convert_as_factor(cp) %>%
                tukey_hsd(values ~ cp)

# Games-Howell Test
grouped_heart %>% convert_as_factor(cp) %>%
                games_howell_test()(values ~ cp)
