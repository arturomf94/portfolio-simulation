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
mean_length = 18
sd_length = 5

# Initialize the data frame for the portfolio 
portfolio = data.frame(1:loan_number)
colnames(portfolio) <- c('id')

#### Simulate Loan Amounts ####

# Generate amounts with bootstrap function
portfolio$amount <- rBootstrap(loan_number, mean_amount, sd_amount, min_amount, max_amount)

# Round amounts to the nearest 5000

portfolio$amount <- round(portfolio$amount / 5000,0) * 5000

# Plot histogram and check stats

ggplot(data=portfolio, aes(portfolio$amount)) + 
  geom_histogram(binwidth = 5000, col = 'darkolivegreen4', fill = 'darkolivegreen3') +
  ggtitle('Histogram of Loan Amounts') +
  labs(y = 'Count', x = 'Amount')

summary(portfolio$amount) 

#### Simulate Loan Lengths ####

portfolio$length <- sample(c(6,12,18), size = length(portfolio$id), replace=TRUE, prob=c(0.05,0.15,.8))

# Plot histogram

ggplot(data=portfolio, aes(portfolio$length)) + 
  geom_histogram(binwidth = 1, col = 'darkolivegreen4', fill = 'darkolivegreen3') +
  ggtitle('Histogram of Loan Lengths') +
  labs(y = 'Count', x = 'Length (Months)')



