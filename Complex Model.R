#complex model run for ABM Class Fall 2021

setwd("~/GitHub/ABM-Course")

#to make sure it is the right place you should do session then set up working directory
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))


#list of parameters

  landscape = 100
  numindiv= 10  #start off with a number of individuals 
  numsteps= 50 #number of steps individuals will take 
  numreps= 5  #
  move = .95  #Likelihood of individuals moving to the next cell 95% of the time they will move 
  numcamera = 50
  
  parameters= expand.grid(landscape,numindiv,numsteps,move,numcamera) #this creates data frame for combination of variables
  colnames(parameters) = c("landscape","numindiv","numsteps","move","numcamera")
  
  
   #RunModel = function(parameters, p, directory, replicates){
  #   FINAL = NULL
    
  for(p in 1:nrow(parameters)){
    landscape = parameters$landscape[p]
    numindiv  = parameters$numindiv[p]
    numsteps    = parameters$numsteps[p]
    move      = parameters$move[p]
    numcamera = parameters$numcamera[p]
    
#initialize landscape 
    land = LandscapeInit(landscape)
    #image(land)  
    
#initialize individuals on landscape
   #pop=matrix(nrow= numindiv, ncol=10) #each individual gets its own row
    pop = Pop(numindiv, land) #
    
#place cameras on landscape
    
    cam = cameras(numcamera)
    
#allow individuals to move within landscape
    
    
    
    
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      n = pop[i,,drop=FALSE] #FIXX
      #the i means iterates
      movepath = Move(landscape,n,numsteps,move,numcamera)
      
      pathways = rbind(pathways, movepath)
      
      
    }
    pop = cbind(pop ,pathways) #will have the same initial points twice 

  
  } 

    
  
  ###extract the output 
  
  
  
  
  
  
 