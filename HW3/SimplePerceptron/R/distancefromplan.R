#' Distance from plan
#'
#' Given any seperator, the idea that one side of the seperator
#' are predicte belong to other class, while other side are predicted
#' to belong to a different class
#' @param z is a vector of x
#' @param w is a unit vector
#' @param b is the directed distance b
#' @export

distance.from.plan <- function(z,w,b){
  sum(z*w) + b
}

