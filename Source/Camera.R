 
#camera stations placement

cameras <- function(cams, numindiv, xcol = 2, ycol = 3){
  cameras   <- cams; # camera number
  for(c in 1:cameras){       # For each camera (c) in the array
    xloc   <- cams[p, xcol]; # Get the x and y locations
    yloc   <- cams[p, ycol];
    #numindiv <- sum( numindiv[, xcol] == xloc & numindiv[, ycol] == yloc);
    
    
    
  }
  # # Now need to return *both* the sampled and individuals arrays
  # samp_indiv <- list(sampled = sampled, numindiv = numindiv);
  # return(samp_indiv);
}