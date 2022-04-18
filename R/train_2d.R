
#' Performing faster perturbed gradient descent algorithm.
#' 
#' Faster perturbed gradient descent algorithm designed for escaping the saddle
#' points more efficiently.
#' 
#' @param trainer a character string specifying the algorithm performed.
#' Currently supported algorithms including: vanilla_gd, AGD, PAGD, FPGD, FPAGD.
#' See reference for detailed meaning.
#' @param params a list containing parameters required by the algorithm. See
#' examples for detail
#' @param gd a function specifying the explicit form of gradient function.
#' @param obj_f a function specifying the objective loss.
#' @param epoch integer. The number of iterations.
#' @return A **data.frame** consists of all the iterations.
#' 
#' The returned data.frame contains the following columns:
#' \itemize{
#'   \item{Column 1: }{The first coordinate of iterate x}
#'   \item{column 2: }{The second coordinate of iterate x}
#'   \item{...}{...}
#'   \item{column n:}{The n-th coordinate of iterate x}
#' }
#' 
#' @examples
#' 
#' params1 = list(x = c(0.6806,0), eta = 0.1, theta = 0.5, epsilon = 1e-2,
#'               radius = 1e-3, v = c(0,0), gamma = 1e-2, s = 0.1, count = 0,
#'               t = 10, zeta = 0, z = c(1,1), x_0 = c(1,1), iter = 0,
#'               t_sub = 5, eta_sub = 0.05)
#' train_2d(PAGD, params1, gd, obj_f, 20)
#' 
## Trainer function, can be used to train other algorithms: -------------------
train_2d = function(trainer, params, gd, obj_f, epoch){
  results = params[[1]]
  for(i in 1:epoch){
    params = trainer(params, gd, obj_f)
    results = rbind(results, params[[1]])
  }
  return(results)
}
#' @description The train_2d function is used to run the gradient-based
#' algorithms to find the stationary point in either first-order or second-order
#' sense.
#' 
#' Use the function `train_2d` to train your data.
#' 
#' See our \href{https://github.com/HongfanChen/PertGD}{Github home page} 
#' or run ?train_2d for examples.
"_PACKAGE"