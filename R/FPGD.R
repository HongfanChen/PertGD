## Faster PGD: ----------------------------------------------------------------
FPGD = function(params, gd, obj_f){
  ## parameters
  x = params[[1]] ## current iterate
  eta = params[[2]] ## stepsize
  epsilon = params[[4]] ## epsilon for first-order stationary points
  radius = params[[5]] ## radius of open ball
  t = params[[10]] ## the script T in paper that controls the perturbation
  zeta = params[[11]] ## iteration gradient, initial 0
  iter = params[[14]] ## number of iterations, initial 0
  eta_sub = params[[16]] ## sub-iterations' updating parameter, you decide
  
  ## unused parameters
  theta = params[[3]] ## momentum parameter
  count = params[[9]] ## count = c(0,1,1,0,0,0..) is the state of perturbation
  v_new = params[[6]]
  gamma = params[[7]]
  s = params[[8]]
  z_new = params[[12]] ## initial x
  x_0 = params[[13]] ## x tilde, initial x
  t_sub = params[[15]] ## sub-iterations' upper bound, you decide
  
  ## Algorithms
  if (norm(gd(x), type = "2") <= epsilon){
    e = NCF(x, radius, t, eta, gd)
    x = x - eta_sub * e
  }
  x_new = x - eta * gd(x)
  
  return(list(x_new, eta, theta, epsilon, radius, v_new, gamma, s, count, t, 
              zeta, z_new, x_0, iter, t_sub, eta_sub))    
} 
