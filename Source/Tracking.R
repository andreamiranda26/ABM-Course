
Tracking=function(pop, CAM) {
   # Record the individuals as captured
Track <- NULL #initialize an empty object with 'CAM <- NULL' and rbind sub to that object

for(m in 1:nrow(pop)){  # the first loop (m in 1:nrow(pop)) loops over each individual in your dataset, and for each individual, the second loop (n in 1:nrow(CAM)) loops over the camera locations stored in CAM to see if any camera locations match the individual's location (the sub <- ... line)
  for(n in 1:nrow(cam)){ #for the number of cameras in a cell
    tempx = pop[m,seq(2,ncol(pop),2)] #we added the variables because it would complain that it was too long
     tempy = pop[m,seq(3,ncol(pop),2)] #sequence starting at number 3 (top line starts at 2 for even numbers) , for the length of pop, every odd number which is two to do every other number 
    sub <- cam[cam[n,2] == tempx  & cam[n,3] == tempy, ]#to see if any camera locations match the individual's location (the sub <- ... line)
    if(nrow(sub) > 0){ #if there's at least one match (nrow(sub) > 0 ), then you can store the information... 
       IDS= pop[m,1] #store somewhere that this individual was captured,you could do something similar as with CAM, where you initialize an empty object with 'OUT <- NULL' and rbind sub to that object
      save<- c(m,n,sub,IDS)
      Track <- rbind(Track, save)
      
    }
  }
}
}

###Notes:
#find all the matching xs then matching y OR
#get something that produces estimate even if not perfectly identifying find in x but not y
#Make code for something that's close to the camera location 

##This is what I will work on after class**
  #find other r packages  this is for future coding 

