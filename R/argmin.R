## X that minimizes the objective function in a small region: -----------------
argmin = function(v1, v2, obj_f){
  if (obj_f(v1) >= obj_f(v2)){
    return(v2)
  } else {
    return(v1)
  }
}