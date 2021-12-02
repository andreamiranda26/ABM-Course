 
#camera stations placement



cameras <- function(numcamera){ 
  
  ID= seq(1,numcamera,1) 
  
    xloc <- sample(1:nrow(land), numcamera) #takes a camera x location out of the landscape
    yloc <- sample(1:ncol(land), numcamera) #takes a y location of the camera on landscape
    
  
    CAM <- cbind(ID, xloc,yloc) #creates that whole CAM object
    
    return(CAM) #this will spit it out when run in complex model
  }

