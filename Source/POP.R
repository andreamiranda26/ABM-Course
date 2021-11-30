
Pop = function(numindiv, landscape){
  
  #how far apart should individuals be, at max?
  #variance = 25 #values is in cells
  
  #initialize pop object
  pop = matrix(nrow=100, ncol=100)
  
  #choose rough starting coordinates
  x = sample(1:(landscape), 1)
  y = sample(1:(landscape), 1)
  
  # #set starting locations with set variance from x,y selected above
  # pop[,1]  = x + rpois(numindiv) # this is what is used to be pop[,1]  = x + rpois(numindiv, variance)
  # pop[,2]  = y + rpois(numindiv)
  # 
  return(pop)
}

