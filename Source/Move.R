
Move=function(landscape,n,numsteps,move,numcamera){
 
  for(s in 1:numsteps){ #numsteps needs to be step size to be 1 cell at a time numsteps should be like 50 
    
    #determine if indiv will move randomly or will move to next cell
    movenext = sample(x=c(0,1), size=1, prob=c((1-move), move)) #this one works with the move parameter in complex model which says that they will move 95% of the time and stay in cell 5% of time.
     
    #random movement to adjacent cell/patch
    if(movenext==0){
      xpos = sample(c(-1,0,1), 1) + cxpos
      ypos = sample(c(-1,0,1), 1) + cypos
    }
    
    #move to next cell if
    if(movenext==1){
      #find next cell
      nxtcell = which(land[(cxpos-1):(cxpos+1), (cypos-1):(cypos+1)] == max(land[(cxpos-1):(cxpos+1), (cypos-1):(cypos+1)]), arr.ind = TRUE)
      
      #calculate new position (x and y values)
      if(nxtcell[1]==1){xpos = cxpos - 1 }
      if(nxtcell[1]==2){xpos = cxpos }
      if(nxtcell[1]==3){xpos = cxpos + 1 }
      if(nxtcell[2]==1){ypos = cypos - 1 }
      if(nxtcell[2]==2){ypos = cypos }
      if(nxtcell[2]==3){ypos = cypos + 1 }
      
      #record new position
      mvmt = c(mvmt, xpos, ypos)
      
      #check to see if individual is at peak; if yes individual remains in same position
      ##if(land[xpos,ypos]>=landscape[2]){
      #fill out remaining positions
      #mvmt=c(mvmt, rep(c(xpos, ypos), (nsteps-((length(mvmt)/2)-1))))
      
      #exit loop
      break
    }
    
    
    
    #check to see if individual is at edge of landscape; if yes individual remains in same position
    if(xpos>=(landscape-1) | ypos>=(landscape-1) | xpos<=1 | ypos<=1){
      #fill out remaining positions
      mvmt=c(mvmt, rep(c(xpos, ypos), (numsteps-((length(mvmt)/2)-1))))
      
      #exit loop
      break
    }
  }
  return(mvmt)
}

