## Complex Model 

- ## Creating an ABM to simulate population counts through camera trapping

**Andrea Miranda and Dr. Janna Willoughby**

Code is used for the complex model assignment in ABM class Fall 2021 at Auburn University


We have outlined our model goals, parameters, and expected functions using the ODD protocol (Grimm et al. 2020):

*Model Overview*


We will use an agent based model to compare the accuracy of individual detections among our simulated populations. Our models will simulate, at the individual level, a population. We will manipulate population density, and movement patterns for individuals. This model will serve as a backbone for a future simulation that will be built . We have outlined our model goals, parameters, and expected functions using the ODD protocol (Grimm et al. 2020):

Overview
Purpose: This model will compare population size estimates of camera trapping. 

Entities, state variables, and scale: Our models will have two entities: individuals that move around the landscape and the landscape itself. The individuals will be characterized by a unique ID and will be permitted to move at specified rates and directions. The landscape will include a grid of squares that will represent a unit area, scaled such that a square is equal to the distance an individual moves in a day. The landscape will also include sample locations, which will represent the location of cameras.

Process overview: Simulated individuals will be permitted to travel a specified number of grid cells each run in a randomly selected direction. At the end of each simulated "day", individuals that end in or pass through sample locations will be marked as ‘sampled’ for the methods explored in that particular model run. At the end of each simulated study, the number of individuals detected will be compared to the known population size, and all of these data will be stored for later analyses. 

Design concepts
This model is based on the theory that methods of measureing individual counts and population abundances can be compared with an agent-based model. Stochasticity in the model will occur by randomly selecting movement distance (within species specified limits) and direction. Our initial model will not include individual interactions, although future iterations may include interactions such as those that occur in pack animals.

Details
Initialization: The initial setup of the model will involve the gridded landscape which will contain individuals and sampling sites. The individuals will be initially placed randomly around in the landscape. 

Functions/subroutines: Our model will include two major functions: movement and sampling. Movement will occur in random direction and will incorporate a draw from a range of distances that will vary between runs. The sampling function will simulate camera traps.

**Expected Outcomes**

We expect that the more cameras placed on the lansdcape the more they will capture individuals. In this study, it is possible that we will not find any differences in individual counts between different number of cameras placed on the landscape.

