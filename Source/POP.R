
Pop = function(numindiv, landscape){
  
  #how far apart should individuals be, at max?
  #variance = 25 #values is in cells

  
  #initialize pop object
  pop = matrix(nrow=numindiv, ncol=3)
  
  #choose rough starting coordinates
  x = sample(1:ncol(landscape), numindiv)
  y = sample(1:nrow(landscape), numindiv)
  
  #creating ID 
  ID= seq(1,numindiv,1) 
  
  colnames(pop)= c("ID", "Xloc", "yloc") #set columns names to
  
  # #set starting locations with set variance from x,y selected above
  pop[,1]  = ID 
  pop[,2]  = x
  pop[,3]  = y
  
  
  return(pop)
}

