#============================================  
#camera stations placement?
#============================================ 
cameras <- function(cams, numindiv, xcol = 2, ycol = 3){
  cameras   <- dim(cams)[1]; # camera number
  for(c in 1:cameras){       # For each camera (c) in the array
    xloc   <- cams[p, xcol]; # Get the x and y locations
    yloc   <- cams[p, ycol];
    numindiv <- sum( numindiv[, xcol] == xloc & numindiv[, ycol] == yloc);
    
    #=======================================  
    #tracking of individual 
    #=======================================      
    if(numindiv > 0){ # If there is an individual, capture them
      sampled <- which( numindiv[, xcol] == xloc & numindiv[, ycol] == yloc);
      if(numindiv < 0){ # But if less than 0 no capture
        sampled <- sample(x = numindiv, size = 0, replace = FALSE);
      }
      numindiv[sampled, dcol] <- 1; # Record the individuals as captured
    }
  }
  # Now need to return *both* the sampled and individuals arrays
  samp_indiv <- list(sampled = sampled, numindiv = numindiv);
  return(samp_indiv);
}