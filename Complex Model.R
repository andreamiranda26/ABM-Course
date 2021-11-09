
setwd("~/GitHub/ABM-Course/Source")

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
  colnames(parameters) = c("landscape","numindiv","numsteps","move","numcamera")
  
  
p=1
  for(p in 1:nrow(parameters)){
    landscape = parameters$landscape[p]
    numindiv  = parameters$numindiv[p]
    nsteps    = parameters$nsteps[p]
    move      = parameters$move[p]
    numcamera = parameters$numcamera[p]
    

#initialize individuals on landscape
   
    pop = Pop(numindiv, landscape)
    #points(Pop[,1]/100, Pop[,2]/100, pch=21, cex=0.5)
    #pop = rbind(pop,NewPop(nindv,landscape)) #this will add the different NewPops together
    #plot(-100,-100, xlim=c(0,100), ylim=c(0,100))  #this puts the points on its own figure (note 0-100 axes)
    #points(pop[,1], pop[,2], pch=19, cex=0.5) #puts points on own fig
    
    #allow individuals to move within landscape
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      indv = pop[i,,drop=FALSE]
      #the i means iterates
      
 #####     #chart movement
      movepath = MoveIndv(landscape,numindiv,numsteps,move,numcamera)
      
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
  
#============================================  
#camera stations placement?
#============================================ 
  cameras <- function(cams, inds, xcol = 2, ycol = 3, rcol = 4, dcol = 5){
    cameras   <- dim(cams)[1]; # camera number
    for(c in 1:cameras){       # For each camera (c) in the array
      xloc   <- pred[p, xcol]; # Get the x and y locations
      yloc   <- pred[p, ycol];
      numindiv <- sum( inds[, xcol] == xloc & inds[, ycol] == yloc);
  
#=======================================  
#tracking of individual 
#=======================================      
      if(numindiv > 0){ # If there is an individual, capture them
        sampled <- which( inds[, xcol] == xloc & inds[, ycol] == yloc);
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
  
  
#extract the output ,  havent modified this one yet 
  # =============================================================================
  # Print the results
  # =============================================================================
  ind_abund <- array(data = NA, dim = c(40, 3));
  for(i in 1:40){
    ind_abund[i, 1] <- i;                      # Save the time step
    ind_abund[i, 2] <- dim(inds_hist[[i]])[1]; # rows in inds_hist[[i]]
    ind_abund[i, 3] <- dim(pred_hist[[i]])[1]; # rows in pred_hist[[i]]
  }
  colnames(ind_abund) <- c("time_step", "abundance", "predators");
  print(ind_abund);
  
  # =============================================================================
  # Plot the results
  # =============================================================================
  par(mar = c(5, 5, 1, 1));
  plot(x = ind_abund[,2], type = "l", lwd = 3, ylim = c(0, 80), 
       xlab = "time step", ylab = "Population abundance", cex.axis = 1.5, 
       cex.lab = 1.5);
  points(x = ind_abund[,3], type = "l", lwd = 3, col = "red");
  legend(x = 0, y = 80, legend = c("Predator", "Prey"), col = c("red", "black"),
         cex = 1.25, lty = c("solid", "solid"), lwd = c(3, 3));
  
