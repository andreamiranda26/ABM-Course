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
  numreps= 1  #number of replicates
  move = .95  #Likelihood of individuals moving to the next cell 95% of the time they will move 
  numcamera = 50 #number of cameras placed on the landscape
  
  parameters= expand.grid(landscape,numindiv,numsteps,move,numcamera) #this creates data frame for combination of variables
  colnames(parameters) = c("landscape","numindiv","numsteps","move","numcamera")
  
  #=====This is something that I will worry about after class====#
   #RunModel = function(parameters, p, directory, numreps){
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
    pop = Pop(numindiv, land) #individuals placed on the landscape 
    write.table(pop, paste(directory, "/Output/initialpoploc_", ".csv", sep=""), sep=",", col.names=TRUE, append=FALSE, quote=FALSE, row.names=FALSE)
    #summary table should have nrows = the individuals and columns are the initial locations of the individuals (first xloc and yloc) 
    
    
    
#place cameras on landscape
    
    cam = cameras(numcamera)
    plot(cam)
    write.table(cam, paste(directory, "/Output/cameralocation", ".csv", sep=""), sep=",", col.names=TRUE, append=FALSE, quote=FALSE, row.names=FALSE)
    #summary table should have nrows = the individuals and columns are the initial locations of the individuals (first xloc and yloc) and the rest of the xloc and y loc are the the places where both individuals and cameras were found
    
    
#Combining location of cameras and individuals 
    
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      n = pop[i,,drop=FALSE] 
      #the i means iterates
      movepath = Move(landscape,n,numsteps,move,numcamera)
      #plot(movepath[seq(1,100,2)]= "location on x", movepath[seq(2,100,2)] = "location on y", type="b") #type b means both points and lines this will show the paths a little better
      pathways = rbind(pathways, movepath) # record path in a single object for all individuals 
      
      plot(pathways, type= "p") #this one gives me yloc in y and xloc in x axis
      #this is the path recorded in one figure for all 10 individuals?
      dev.copy(png, "../output/Pathways.png") #This will give you the same plot above but saves it to the source folder that you had everything 
      dev.off()
      
    }
    #Output 
    pop = cbind(pop ,pathways) #will have the same initial points twice 
    
    plot(pop, type= "p") #this gives me xloc n y axis and ID in x axis, I assume this is where the individuals ended up at the end of the 50 steps
    dev.copy(png, "../output/pop.png") #This will give you the same plot above but saves it to the output
    dev.off()
  } 

    
  
  ###extract the output 
  
  write.table(pop, paste(directory, "/Output/summary_", ".csv", sep=""), sep=",", col.names=TRUE, append=FALSE, quote=FALSE, row.names=FALSE)
  #summary table should have nrows = the individuals and columns are the initial locations of the individuals (first xloc and yloc) and the rest of the xloc and y loc are the the places where both individuals and cameras were found
  
  
 
 
  
 
  
  
  
 