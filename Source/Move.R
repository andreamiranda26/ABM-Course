
Move=function(landscape,n,numsteps,move,numcamera){
 stepsize=1
  for(s in 1:numsteps){ #numsteps needs to be step size to be 1 cell at a time numsteps should be like 50 
    
    #determine if indiv will move randomly or will move to next cell
    movenext = sample(x=c(0,1), size=1, prob=c((1-move), move)) #this one works with the move parameter in complex model which says that they will move 95% of the time and stay in cell 5% of time.
     
    #what Janna had explained in class
    #step
    
   
    steps{
      locs= c(n[,2], n[,3])
      
    #do you move? if no then keep same position 
    if(movenext==0){ #if(movenext!=1)
      xpos= locs[-2] + 0 
      ypos= locs[-1] + 0
    }
    
      
    #if they do decide to move yes and randomly move 1 cell 
    if(movenext==1){ #does the 1 mean yes?
     xpos= locs[-2] + sample(c(-1,0,1)) 
     ypos= locs[-1] + sample(c(-1,0,1)) 
     
     locs=c(locs,xpos,ypos)
     
     
     }
    
  }  
}
 return(locs)  
}  
