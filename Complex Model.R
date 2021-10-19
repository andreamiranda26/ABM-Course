
setwd("~/GitHub/ABM_Course/")
directory = getwd()


#parameters

  landscape = 100
  numindiv= 50  #start off with a number of individuals 
  numsteps= 10
  numreps= 5
  move = 10
  
  
  parameters= expand.grid(landscape,numindiv,numsteps,move) #this creates data frame for combination of variables
  

  for(p in 1:nrow(parameters)){
    landscape = parameters$landscape[p]
    numindiv = parameters$numindiv[p]
    nsteps    = parameters$nsteps[p]
    move      = parameters$move[p]
    

#initialize landscape and adding individuals 
  pop = NewPop(numindiv, landscape)
  
  pop= createpop(numindiv)

  land= landscapeInit(landscape,landscape)
  image(land)


  
#loops of some sort
  
  for(y in 1: )
    
    movepath = MoveIndv(numindiv, land, move, nsteps,landscape)
  
    
#extract the output 

