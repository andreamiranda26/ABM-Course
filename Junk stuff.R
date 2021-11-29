#tracking of individual #this would be easier if we have the individuals iterating once at a time but with the same placement of cameras and the same x and y coordinates of paths? 

if(numindiv > 0){ # If there is an individual, capture them
  sampled <- which( numindiv[, xcol] == xloc & numindiv[, ycol] == yloc);
  if(numindiv < 0){ # But if less than 0 no capture
    sampled <- sample(x = numindiv, size = 0, replace = FALSE);
  }
  
}

#this would also go in the function part 
# The reflecting boundary is added below this takes place of the above stuff that if individual is at the edge it stays in same position 
# for(i in 1:numindiv){           # For each individual i in the array
#   if(numindiv[i, xpos] > xmax){       # If it moved passed the maximum xloc
#     numindiv[i, xpos] <- xmax - 1;    # Then move it back toward the center
#   }
#   if(numindiv[i, xpos] < 1){          # If it moved below 1 on xloc
#     numindiv[i, xpos] <- 2;           # Move it toward the centre (2)
#   }
#   if(numindiv[i, ypos] > ymax){         # If it moved passed the maximum yloc
#     numindiv[i, ypos] <- ymax - 1;      # Then move it back toward the centre
#   }
#   if(numindiv[i, ypos] < 1){            # If it moved below 1 on yloc
#     numindiv[i, ypos] <- 2;             # Then move it toward the centre (2)
#   }
#   return(numindiv);
# } 



#havent modified this one yet 
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