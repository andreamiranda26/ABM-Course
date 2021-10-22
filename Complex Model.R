
setwd("~/GitHub/ABM_Course/")
directory = getwd()


#list of parameters

  landscape = 100
  numindiv= 50  #start off with a number of individuals 
  numsteps= 10
  numreps= 5
  move = 10
  total_inds   <- dim(inds)[1]; # Get the number of individuals in inds
  move_dists   <- c(-1, 0, 1);  # Define the possible distances to move
  numcamera = 
  
  parameters= expand.grid(landscape,numindiv,numsteps,move) #this creates data frame for combination of variables
  

  for(p in 1:nrow(parameters)){
    landscape = parameters$landscape[p]
    numindiv  = parameters$numindiv[p]
    nsteps    = parameters$nsteps[p]
    move      = parameters$move[p]
    

#initialize landscape and adding individuals 
  pop = NewPop(numindiv, landscape)
  
  pop= createpop(numindiv)

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
  
  
#Individual tracking of individual 
  
  
#extract the output 

