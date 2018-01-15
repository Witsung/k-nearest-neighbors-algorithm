load("~/NNData")
library(class)
require(utils)

#randomly generate test data and test it in knn
mat <- matrix(c(data$x,data$y),nrow=length(data$x))
dist(mat, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
test = c(runif(2, min=0, max=3))
knn(mat, test, cl = data$class, k = 1, l = 0, prob = FALSE, use.all = TRUE)

#visulaize knn algorithm
test2 = expand.grid(x = seq(0, 3, 0.05), y= seq(0, 3, 0.05))
plot(data$x, data$y, pch = c(5, 2)[data$class], col=c("red","green")[data$class])
label = knn(mat, test2, cl = data$class, k = 1, l = 0, prob = FALSE, use.all = TRUE)
plot(test2$x, test2$y, pch = 15, col=c("red","green")[label])
