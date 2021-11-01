
setwd("~/GitHub/ABM_Course/")

#to make sure it is the right place you should do session then set up working directory
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))


#list of parameters

  landscape = 100
  numindiv= 50  #start off with a number of individuals 
  numsteps= 1 #number of steps individuals will take 
  numreps= 5  #
  move = 10   #Likelihood of individuals moving to the next cell
  numcamera = 50
  
  parameters= expand.grid(landscape,numindiv,numsteps,move,numcamera) #this creates data frame for combination of variables
  

  for(p in 1:nrow(parameters)){
    landscape = parameters$landscape[p]
    numindiv  = parameters$numindiv[p]
    nsteps    = parameters$nsteps[p]
    move      = parameters$move[p]
    numcamera = parameters$numcamera[p]
    

#initialize individuals on landscape
   
    pop = NPop(nindvs, landscape)
    points(pop[,1]/150, pop[,2]/150, pch=21, cex=0.5)
    #pop = rbind(pop,NewPop(nindv,landscape)) #this will add the different NewPops together
    #plot(-100,-100, xlim=c(0,150), ylim=c(0,150))  #this puts the points on its own figure (note 0-150 axes)
    #points(pop[,1], pop[,2], pch=19, cex=0.5) #puts points on own fig
 
    NewPop = function(nindvs, landscape){
      #how far apart should individuals be, at max?
      variance = 25 #values is in cells
      
      #initialize pop object
      pop = matrix(nrow=nindvs, ncol=2)
      
      #choose rough starting coordinates
      x = sample(1:(landscape-variance), 1)
      y = sample(1:(landscape-variance), 1)
      
      #set starting locations with set variance from x,y selected above
      pop[,1]  = x + rpois(nindvs, variance)
      pop[,2]  = y + rpois(nindvs, variance)
      
      return(pop)
    }
    
    pop = NewPop(numindiv, landscape)
    points(pop[,1]/150, pop[,2]/150, pch=19, cex=0.5)
    #plot(-100,-100, xlim=c(0,150), ylim=c(0,150))
    #points(pop[,1], pop[,2], pch=19, cex=0.5)
    
  

  land= landscapeInit(landscape,landscape)
  image(land)


  
#Movement function
  
  movement <- function(inds, xloc = 2, yloc = 3, xmax = 8, ymax = 8){
    
    total_inds   <- dim(inds)[1]; # Get the number of individuals in inds
    move_dists   <- c(-1, 0, 1);  # Define the possible distances to move
    x_move       <- sample(x = move_dists, size = total_inds, replace = TRUE);
    y_move       <- sample(x = move_dists, size = total_inds, replace = TRUE);
    inds[, xloc] <- inds[, xloc] + x_move;
    inds[, yloc] <- inds[, yloc] + y_move;
    
    #determine if indv will move randomly or will move to higher elevation
    movehigh = sample(x=c(0,1), size=1, prob=c((1-move), move))
    
    #random movement to adjacent cell/patch
    if(movehigh==0){
      xpos = sample(c(-1,0,1), 1) + cxpos
      ypos = sample(c(-1,0,1), 1) + cypos
    }
    
    #this wouold also go in the function part 
    # =========   The reflecting boundary is added below
    for(i in 1:total_inds){           # For each individual i in the array
      if(inds[i, xloc] > xmax){       # If it moved passed the maximum xloc
        inds[i, xloc] <- xmax - 1;    # Then move it back toward the center
      }
      if(inds[i, xloc] < 1){          # If it moved below 1 on xloc
        inds[i, xloc] <- 2;           # Move it toward the centre (2)
      }
      if(inds[i, yloc] > ymax){         # If it moved passed the maximum yloc
        inds[i, yloc] <- ymax - 1;      # Then move it back toward the centre
      }
      if(inds[i, yloc] < 1){            # If it moved below 1 on yloc
        inds[i, yloc] <- 2;             # Then move it toward the centre (2)
      }
    } 
    return(inds);
  }
  
  
#camera stations
  
  cameras <- function(cams, inds, xcol = 2, ycol = 3, rcol = 4, dcol = 5){
    cameras   <- dim(cams)[1]; # camera number
    for(c in 1:cameras){       # For each camera (c) in the array
      xloc   <- pred[p, xcol]; # Get the x and y locations
      yloc   <- pred[p, ycol];
      N_prey <- sum( inds[, xcol] == xloc & inds[, ycol] == yloc);
  
  
#tracking of individual 
  
  
#extract the output 

