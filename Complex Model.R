
setwd("~/GitHub/ABM-Course")

#to make sure it is the right place you should do session then set up working directory
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))


#list of parameters

  landscape = 100
  numindiv= 10  #start off with a number of individuals 
  numsteps= 1 #number of steps individuals will take 
  numreps= 5  #
  move = 5   #Likelihood of individuals moving to the next cell
  numcamera = 50
  
  parameters= expand.grid(landscape,numindiv,numsteps,move,numcamera) #this creates data frame for combination of variables
  colnames(parameters) = c("landscape","numindiv","numsteps","move","numcamera")
  
  

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
   
    pop = Pop(numindiv, landscape) #
    
#place cameras on landscape
    
    cam = cameras(cams=numcamera, numindiv, xcol = 2, ycol = 3)
    
#allow individuals to move within landscape
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      numindiv = pop[i,,drop=FALSE]
      #the i means iterates
      
 #####     #chart movement
      movepath = Move(landscape,numindiv,numsteps,move,numcamera)
      
      #plot movement
      lines(movepath[seq(1,length(movepath), 2)]/100, movepath[seq(2,length(movepath), 2)]/100, lwd=2)
      
      #record path in single object for all individuals
      pathways = rbind(pathways, movepath)
      
    }

  
  } 

    
  
  ###extract the output 
 