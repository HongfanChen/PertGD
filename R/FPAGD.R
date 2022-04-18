## Faster PAGD: ---------------------------------------------------------------
FPAGD = function(params, gd, obj_f){
  ## Paramters
  x = params[[1]] ## current iterate
  eta = params[[2]] ## stepsize
  theta = params[[3]] ## momentum parameter
  epsilon = params[[4]] ## epsilon for first-order stationary points
  radius = params[[5]] ## radius of open ball
  count = params[[9]] ## count = c(0,1,1,0,0,0..) is the state of perturbation
  t = params[[10]] ## the script T in paper that controls the perturbation
  v = params[[6]]
  gamma = params[[7]]
  s = params[[8]]
  zeta = params[[11]] ## iteration gradient, initial 0
  z = params[[12]] ## initial x
  x_0 = params[[13]] ## x tilde, initial x
  iter = params[[14]] ## number of iterations, initial 0
  t_sub = params[[15]] ## sub-iterations' upper bound, you decide
  eta_sub = params[[16]] ## sub-iterations' updating parameter, you decide
  
  ## Algorithms
  x_new = z - eta * (gd(z) - zeta)
  v_new = x_new - x
  z_new = x_new + (1 - theta) * v_new
  
  if (norm(gd(x), type = "2") <= epsilon && iter - count > t){
    x_0 = x
    x = uniball(radius) + x_0
    z = x
    zeta = gd(x_0)
    count = iter
    
    x_new = z - eta * (gd(z) - zeta)
    v_new = x_new - x
    z_new = x_new + (1 - theta) * v_new
    iter = iter + 1
  }else if(iter - count == t_sub){
    e = (x - x_0) / norm((x - x_0), type = "2")
    x = x_0 - eta_sub * e
    z = x
    zeta = 0
    
    x_new = z - eta * (gd(z) - zeta)
    v_new = x_new - x
    z_new = x_new + (1 - theta) * v_new
    iter = iter + 1
  }else if(count != 0 && iter - count < t_sub){
    z_new = x_0 + radius * (z_new - x_0) / norm((z_new - x_0), type = "2")
    x_new = x_0 + radius * (x_new - x_0) / norm((z_new - x_0), type = "2")
    iter = iter + 1
  }else{
    if(obj_f(x_new) <= obj_f(z_new) + sum(gd(z_new) * (x_new-z_new)) - 
       gamma / 2 * sum((z_new - x_new)^2)){
      
      x_new = c(NCE(x, v, s, obj_f)[1], NCE(x, v, s, obj_f)[2])
      v_new = c(NCE(x, v, s, obj_f)[3], NCE(x, v, s, obj_f)[4])
      z_new = x_new + (1 - theta) * v_new
    }
    iter = iter + 1
  }
  return(list(x_new, eta, theta, epsilon, radius, v_new, gamma, s, count, t, 
              zeta, z_new, x_0, iter, t_sub, eta_sub))    
} 