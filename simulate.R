#### Portfolio Simulation ####

#### Required Packages ####
library(dplyr)
library(ggplot2)

#### Required Functions ####

source('functions.R')

# Set seed
set.seed(1994)

#### Parameters ####

loan_number = 4000
max_amount = 250000
min_amount = 40000
mean_amount = 200000
sd_amount = 40000

# Initialize the data frame for the portfolio 
portfolio = data.frame(1:loan_number)
colnames(portfolio) <- c('id')

#### Simulate Loan Amounts ####

# Generate amounts with bootstrap function
portfolio$amount <- rBootstrap(loan_number, mean_amount, sd_amount, min_amount, 250000)

# Round amounts to the nearest 5000

portfolio$amount <- round(portfolio$amount / 5000,0) * 5000

# Plot histogram and check distribution

ggplot(data=portfolio, aes(portfolio$amount)) + 
  geom_histogram(binwidth = 5000, col = 'darkolivegreen4', fill = 'darkolivegreen3')

summary(portfolio$amount) 

