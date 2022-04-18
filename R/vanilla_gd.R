## Vanilla gradient descent: --------------------------------------------------
vanilla_gd = function(params, gd, obj_f){
  ## Parameters
  x = params[[1]] ## current iterate
  eta = params[[2]]
  
  ## Unused parameters
  v_new = params[[6]]
  theta = params[[3]] ## momentum parameter
  epsilon = params[[4]] ## epsilon for first-order stationary points
  radius = params[[5]] ## radius of open ball
  count = params[[9]] ## count = c(0,1,1,0,0,0..) is the state of perturbation
  t = params[[10]] ## the script T in paper that controls the perturbation
  gamma = params[[7]]
  s = params[[8]]
  zeta = params[[11]] ## iteration gradient, initial 0
  z_new = params[[12]] ## initial x
  x_0 = params[[13]] ## x tilde, initial x
  iter = params[[14]] ## number of iterations, initial 0
  t_sub = params[[15]] ## sub-iterations' upper bound, you decide
  eta_sub = params[[16]] ## sub-iterations' updating parameter, you decide
  ## Algorithms
  x_new = x - eta * gd(x)
  return(list(x_new, eta, theta, epsilon, radius, v_new, gamma, s, count, t, 
              zeta, z_new, x_0, iter, t_sub, eta_sub))
}