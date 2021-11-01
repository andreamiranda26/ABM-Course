
setwd("~/GitHub/ABM_Course/")

#to make sure it is the right place you should do session then set up working directory
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))


#list of parameters

  landscape = 100
  numindiv= 1  #start off with a number of individuals 
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
    
    #allow individuals to move within landscape
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      indv = pop[i,,drop=FALSE]
      #the i means iterates
      
      #chart movement
      movepath = MoveIndv(numind, land, move, nsteps, elevation, landscape)
      
      #plot movement
      lines(movepath[seq(1,length(movepath), 2)]/150, movepath[seq(2,length(movepath), 2)]/150, lwd=2)
      
      #record path in single object for all individuals
      pathways = rbind(pathways, movepath)
      
  }
  rownames(pathways) = seq(1,nindvs,1)
  dev.copy(png, "../output/Butter.png") #saves it to the source folder that you had everything, albeit adding 'output' saves it in the output folder
  dev.off() #need to add this if not it will not save, if you do the pdf code at the top and close it off then you can open it and see even through the steps. 
  
  #extract needed output from simulation
  #for this project it is fine to NOT do any stats, but you will want to export something (maybe a figure) so you and
  #everyone can see how your model worked. we will use this to talk about approaches that worked well/did not work great.
  
  } 
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
      
      if(numindiv > 0){ # If there is an individual, capture them
        sampled <- which( inds[, xcol] == xloc & inds[, ycol] == yloc);
  
#extract the output 

