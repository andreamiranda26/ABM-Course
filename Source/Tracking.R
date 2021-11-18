

#tracking of individual #this would be easier if we have the individuals iterating once at a time but with the same placement of cameras and the same x and y coordinates of paths? 

if(numindiv > 0){ # If there is an individual, capture them
  sampled <- which( numindiv[, xcol] == xloc & numindiv[, ycol] == yloc);
  if(numindiv < 0){ # But if less than 0 no capture
    sampled <- sample(x = numindiv, size = 0, replace = FALSE);
  }
  numindiv[sampled, dcol] <- 1; # Record the individuals as captured
}