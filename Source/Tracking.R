
Tracking=function(pop, CAM) {
   # Record the individuals as captured
Track <- NULL #initialize an empty object with 'CAM <- NULL' and rbind sub to that object

for(m in 1:nrow(pop)){  # the first loop (m in 1:nrow(pop)) loops over each individual in your dataset, and for each individual, the second loop (n in 1:nrow(CAM)) loops over the camera locations stored in CAM to see if any camera locations match the individual's location (the sub <- ... line)
  for(n in 1:nrow(CAM)){ #for the number of cameras in a cell
    sub <- CAM[CAM[n,2] == pop[m,2] & CAM[n,3] == pop[m,3],]  #to see if any camera locations match the individual's location (the sub <- ... line)
    if(nrow(sub) > 0){ #if there's at least one match (nrow(sub) > 0 ), then you can store the information... 
       ID = pop[m,1] #store somewhere that this individual was captured,you could do something similar as with CAM, where you initialize an empty object with 'OUT <- NULL' and rbind sub to that object
      save<- c(m,n,sub, ID)
      Track <- rbind(Track, save)
      
    }
  }
}
}
