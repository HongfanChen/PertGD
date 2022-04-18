## Negative curvature finding: ------------------------------------------------
NCF = function(x, radius, t, eta, gd){
  y = uniball(radius) + x
  for (i in 1:t) {
    y = y - (norm(y, type = "2") * eta / radius) * 
      (gd(x + radius * y / norm(y, type = "2")) - gd(x))
    # normalize
    y = y * radius / norm(y, type = "2") 
  }
  return(y * t / radius)
}