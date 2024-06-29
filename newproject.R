data(mtcars)


head(mtcars)


print(summary(mtcars))


if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}


library(ggplot2)


avg_mpg <- aggregate(mpg ~ cyl, data = mtcars, mean)



if (!requireNamespace("fmsb", quietly = TRUE)) {
  install.packages("fmsb")
}


library(fmsb)


data_radar <- mtcars[, c("mpg", "hp", "wt", "qsec")]


data_norm <- as.data.frame(scale(data_radar))


row.names(data_norm) <- row.names(mtcars)

radar_chart <- radarchart(data_norm,
                          title = "Radar Chart of Car Features",
                          axistype = 1,
                          seg = 4,
                          pcol = 1:dim(data_radar)[2],
                          plwd = 2,
                          plty = 1,
                          axislabcol = "grey",
                          vlcex = 0.8)


print(radar_chart)

