#' Classify Linear
#'
#' @param x is vector of inputs
#' @param w is a unit vector
#' @param b is the directed distance b
#' @export

classify.linear = function(x,w,b){
  distances = apply(x,1,distance.from.plan,w,b)
  return(ifelse(distances < 0, -1,+1))
}
