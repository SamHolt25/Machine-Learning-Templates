# Random Forest Intuition

dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

# Random Forest Regressor
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], 
                         y = dataset$Salary,
                         ntree = 500)
#square brackets [ ] create dataframes, $ creates vectors
 
# Predict with Rand Forest
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualise results
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid,
                y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Random Forest Regression (500 Trees') + 
  xlab('Level') +
  ylab('Salary')

