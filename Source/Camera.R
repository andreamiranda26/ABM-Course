 
#camera stations placement


CAM <- NULL

cameras <- function(cams){
  for(c in 1:cams){
    xloc <- sample(1:nrow(land), 50)
    yloc <- sample(1:nrow(land), 50)
    
    save <- c(c, xloc, yloc)
    CAM <- rbind(CAM, save)
  }
}

