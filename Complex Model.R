
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
    

#initialize individuals on landscape
   
    pop = Pop(numindiv, landscape)
    points(Pop[,1]/100, Pop[,2]/100, pch=21, cex=0.5)
    #pop = rbind(pop,NewPop(nindv,landscape)) #this will add the different NewPops together
    #plot(-100,-100, xlim=c(0,100), ylim=c(0,100))  #this puts the points on its own figure (note 0-100 axes)
    #points(pop[,1], pop[,2], pch=19, cex=0.5) #puts points on own fig
    
    
    
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

    
 
  

  
  
#######extract the output ,  havent modified this one yet 
  # =============================================================================
  # Print the results
  # =============================================================================
  samp_indiv <- array(data = NA, dim = c(40, 3));
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
  
  
  #need to figure this out :(
  rownames(pathways) = seq(1,nindvs,1)
  dev.copy(png, "~/GitHub/ABM-Course/Output") #saves it to the source folder that you had everything, albeit adding 'output' saves it in the output folder
  dev.off() #need to add this if not it will not save, if you do the pdf code at the top and close it off then you can open it and see even through the steps. 
  
  #extract needed output from simulation
  #for this project it is fine to NOT do any stats, but you will want to export something (maybe a figure) so you and
  #everyone can see how your model worked. we will use this to talk about approaches that worked well/did not work great.