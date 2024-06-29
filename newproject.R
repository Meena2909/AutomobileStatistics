# Load the mtcars dataset
data(mtcars)

# View the first few rows of the dataset
head(mtcars)

# Print summary of the dataset
print(summary(mtcars))

# Install ggplot2 if not already installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Load ggplot2
library(ggplot2)

# Calculate average mpg by number of cylinders
avg_mpg <- aggregate(mpg ~ cyl, data = mtcars, mean)

# Bar graph of average mpg by number of cylinders
bar_plot <- ggplot(avg_mpg, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) +
  geom_bar(stat = "identity") +
  labs(title = "Average MPG by Number of Cylinders", x = "Number of Cylinders", y = "Average Miles Per Gallon (MPG)") +
  scale_fill_discrete(name = "Cylinders")

# Print the bar graph
print(bar_plot)

# Install fmsb if not already installed
if (!requireNamespace("fmsb", quietly = TRUE)) {
  install.packages("fmsb")
}

# Load fmsb
library(fmsb)

# Prepare the data for radar chart
data_radar <- mtcars[, c("mpg", "hp", "wt", "qsec")]

# Normalize the data for radar chart
data_norm <- as.data.frame(scale(data_radar))

# Add row names for better identification
row.names(data_norm) <- row.names(mtcars)

# Radar chart
radar_chart <- radarchart(data_norm,
                          title = "Radar Chart of Car Features",
                          axistype = 1,
                          seg = 4,
                          pcol = 1:dim(data_radar)[2],
                          plwd = 2,
                          plty = 1,
                          axislabcol = "grey",
                          vlcex = 0.8)

# Print the radar chart
print(radar_chart)

