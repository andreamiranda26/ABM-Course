LandscapeInit = function(landscape){
  
  #set up object
  land  = matrix(nrow=landscape, ncol=landscape)
  
  
  #work from edges and fill in elevation; similar to above but can now do entire columns at one time
  for(r in (xpeak-1):1){
    land[r,] = land[(r+1),] - round(rnorm(landscape, 5, 2), 0)
  }
  for(r in (xpeak+1):landscape){
    land[r,] = land[(r-1),] - round(rnorm(landscape, 5, 2), 0)
  }
  
  #return land object
  return(land)
}
