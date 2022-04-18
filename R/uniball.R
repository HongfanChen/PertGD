## Generate sample ~ Unif(B(r)): ----------------------------------------------
uniball = function(r){
  unit_num1 = runif(1, min = 0, max = 1)
  unit_num2 = runif(1, min = 0, max = 1)
  radius = r * sqrt(unit_num1)
  theta = 2 * pi * unit_num2
  x = radius * cos(theta)
  y = radius * sin(theta)
  return(c(x, y))
}