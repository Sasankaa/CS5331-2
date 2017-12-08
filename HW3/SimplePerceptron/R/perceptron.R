#' Simple Perceptron Algorithm
#'
#' @param x  x
#' @param y  y
#' @param learning.rate intialialize learning rate to 1
#' @export
perceptron <- function(x, y, learning.rate=1) {
  w = vector(length = ncol(x)) # initialize w
  b = 0 # Initialize b
  k = 0 # count updates
  R = max(apply(x, 1, euclidean.norm))
  made.mistake = TRUE # to enter the while loop
  while (made.mistake) {
    made.mistake=FALSE
    yc <- classify.linear(x,w,b)
    for (i in 1:nrow(x)) {
      if (y[i] != yc[i]) {
        w <- w + learning.rate * y[i]*x[i,]
        b <- b + learning.rate * y[i]*R^2
        k <- k+1
        made.mistake=TRUE
      }
    } }
  s = euclidean.norm(w)
  return(list(w=w/s,b=b/s,updates=k))
}
