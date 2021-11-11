## Complex Model 

- ## Using modeling to compare population monitoring through camera trapping

**Andrea Miranda and Dr. Janna Willoughby**

Code is used for the complex model assignment in ABM class Fall 2021 at Auburn University


We have outlined our model goals, parameters, and expected functions using the ODD protocol (Grimm et al. 2020):

*Model Overview*


Purpose: This model will compare individual counts of placing different amounts of simulated camera traps on the landscape. 

Entities, state variables, and scale: Our model will have two entities: individuals that move around the landscape and the landscape itself. The individuals will be characterized by a unique ID and will be permitted to move at specified rates and a direction. The landscape will include a grid of squares that will represent a unit area, scaled such that a square is equal to the distance an individual moves in a day. The landscape will also include sample locations, which will represent the location of the cameras. Cameras will be compared by the amount placed on the landscape (50, 100, 150). 

Process overview: Simulated individuals will be permitted to travel a specified number of grid cells each day in a randomly selected direction and creating a path. At the end of each simulated day, individuals that end in or pass through sample locations will be marked as ‘sampled’ for the methods explored in that particular model run. At the end of each simulated study, the number of individuals detected be compared to the known population size, and all of these data will be stored for later analyses. 

Design concepts
This model is based on the theory that the amount of cameras placed on a landscape in study will affect the number of individual counts. Stochasticity in the model will occur by randomly selecting movement distance (within species specified limits) and direction. Our initial model will not include individual interactions, although future iterations may include interactions such as those that occur in pack animals. All models (meaning all sets of model parameters) will be repeated 100 times to assess stability of our modeled outcomes.

Details
Initialization: The initial setup of the model will involve the gridded landscape which will contain individuals and sampling sites. The individuals will be initially placed in a coordinate and allowed to move randomly. 

Functions/subroutines: Our model will include two major functions: movement and sampling. Movement will occur in a random direction which will ultimately create a path. It will incorporate a draw from a range of distances that will vary between runs. The sampling function will simulate camera traps. 

**Expected Outcomes**

We expect that the more cameras placed on the lansdcape the more they will capture individuals. In this study, it is possible that we will not find any differences in individual counts between different number of cameras placed on the landscape.

