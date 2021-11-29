 
#camera stations placement


CAM <- NULL #CAM,initialize an empty object with 'CAM <- NULL' and rbind sub to that object

cameras <- function(cams){
  for(c in 1:cams){
    xloc <- sample(1:nrow(land), 50) #takes a camera x location out of the landscape
    yloc <- sample(1:nrow(land), 50) #takes a y location of the camera on landscape
    
    save <- c(c, xloc, yloc)
    CAM <- rbind(CAM, save)
  }
}

