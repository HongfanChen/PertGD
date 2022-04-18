## Negative Curvature Exploitation: -------------------------------------------
NCE = function(x, v, s, obj_f){
  if (norm(v, type = "2") >= s){
    x_new = x
  } else {
    delta = ifelse(norm(v ,type = "2") == 0, 0, s * v / norm(v ,type = "2"))
    x_new = argmin(x + delta, x - delta, obj_f)
  }
  return(c(x_new, 0, 0))
}