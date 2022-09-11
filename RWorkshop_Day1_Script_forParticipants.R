###R INTENSIVE WITH SNAIL DYNAMICS DATASET----DAY 1###

####Exercise 1: Use R as calculator####

#In R, any command entered is read by the computer from left to right.  
#The importance of this will become more clear with time. 


#You can use R just as a simple calculator by entering equations 
#into the console (and hitting ‘enter’) or your script 
#(and hitting ‘ctrl+enter’).

########START WITH SOME BASIC MATHEMATICAL EQUATIONS:




#Functions in R are structured as a word followed by “()” and then you can 
#put data within the ().

##use the square root function sqrt()


#Sometimes, you may want to save outcomes of a mathematical equations and 
#functions. You can create an object by giving it a name, e.g., “a”, following 
#it with a “=” and then entering the equation of function. You can save simple  
#and complicated pieces of information. You will see with time why it is helpful 
#to save information in this way. 


########SAVE SOME BASIC MATHEMATICAL EQUATION OUTCOMES AS OBJECTS:




#You can also rewrite an object simply by using a name you have already 
#used and the using a new equation.

########REWRITE AN OBJECT YOU ALREADY DEFINED:


#You can also create a string of data by using c() and different values 
#separated by commas. Then, you can use mathematical equations on strings 
#if they are the same length. The mathematical formula will apply across values 
#in the same position in the string.


########CREATE STRINGS OF DATA:


#Categorical values are entered into strings including quotation marks ""
########CREATE STRINGS OF CATEGORICAL AND NUMERICAL DATA:



#A data frame is a data structure that organizes data into a 2-dimension table of 
#rows and columns. This is easier for us to understand and manipulate in R. We 
#can then create a data frame with multiple strings using the 
#data.frame() function

########CREATE A DATAFRAME:



####Exercise 2: Year Summary for Lambo la Mwabasabi####

#We will look at data of just Lambo la Mwabasabi from August 2021 to July 2022. 
#We will create a string for each type of data for all 12 monthly surveys and 
#then combine them by creating a data frame. These data will include:
#1.	month of survey
#2.	days since beginning of survey 
#3.	snails collected 
#4.	infected snails collected 

#First, we will create a string for the 12 survey months:
Survey=c("August2021","September2021","October2021","November2021","December2021","January2022",
         "February2022","March2022 ","April2022","May2022","June2022","July2022")

#I HAVE TYPED THIS AND THE NEXT BIT OF CODE IN AS TYPING IN ALL THESE MONTHS 
#WOULD TAKE FOREVER

#Because this variable is an ordered categorical variable, we will tell R that 
#it has a particular order. Note that we are saving this string with the same 
#name, which will replace the original string. The original string was unordered 
#and would have been interpreted by R alphabetically:

Survey=factor(Survey, levels=c("August2021","September2021","October2021","November2021","December2021","January2022",
                               "February2022","March2022 ","April2022","May2022","June2022","July2022"))


#We then save the number of days since the first survey conducted in August 2021. 
#It must be organized to match the months.
########CREATE A STRING:




#We then save the number of snails collected for each month. 
#It must be organized to match the months.
########CREATE A STRING:



#We lastly save the number of snails collected for each month. It must be 
#organized to match the months:
########CREATE A STRING:


#We will now compile the four strings into a single data frame named 
#Mwaba_data:
########CREATE A DATAFRAME:


#Click on this data frame in the environment and you can see it as a table in 
#the data set viewing area. 

#To access or refer to just one column in the data frame, you will enter the 
#dataframe, followed by a dollar sign “$” and the name of the column.
########REFER TO THE COLUMN:


#Remember R is reading from left to right, so you are telling R to go into this 
#dataframe (Mwaba_data) and thereafter look for this particular column 
#(SnailNumber). 

#We can also save particular columns from data frames as a string
########SAVE COLUMN AS A STRING:


#Because it is only one column it becomes a string. It does not get saved as a 
#data frame. And note it is identical to the string you created earlier named 
#SnailNumber. A data frame is just a collection of strings assembled in a way 
#that is easier for us to understand visually.

#We can explore columns of the data using basic summary statistic functions. 
#Let’s try it with the snail number column

########RUN SUMMARY STATISTICS:



#First scientific question: which time of year do we expect to see the highest 
#number of snails and highest number of infected snails? We can look at this 
#numerically from the table. Or we can plot it visually to see the pattern.

#Remember our independent variable (causing the pattern) should be on the x axis 
#(bottom) and the dependent variable (affected by independent variable should be 
#on the y axis (left).

##FORMAT: barplot(dependent variable~independent variable)

########CREATE BARPLOTS:



#Because we have different numbers of snails each month, it is more accurate to 
#look at the how the proportion (percentage) of snails that are infected over 
#time.

#We already perform mathematical equations on strings of equal lengths. We can 
#also perform mathematical formulas across columns. We can calculate the monthly 
#prevalence (proportion of snails infected in each month) for Lambo la Mwabasabi.

########CREATE A NEW COLUMN WITH PREVALENCE:


#We can also plot the data as a scatter plot using the function plot().

########PLOT A SCATTER PLOT:


#Before we take a break, we will clean the environment, so it is empty and not 
#cluttered for the next exercise. Click on the little icon that looks like a 
#broom in the environment section of R studio.


####Exercise 3: Opening datasets in R####

#Sometimes you will want to open datasheets that have already been made. Typing 
#these in as strings would take a long time for big datasets. 


##GUI option
#We can open datasheets by using the buttons available in the R studio platform:

#1.	Click on the “Import Dataset” button in the environment section of R studio
#2.	Click on the “From Excel” button from the dropdown menu
#3.	Click on the “Browse” button in the window that opens
#4.	Find the datasheet we are using for this task.
#5.	Click on the “Import” button
#6.	You can now see it the data frame is available in the environment. The table 
#has been opened in the viewing area. The dataframe has automatically been named 
#based on the file name. 


###Code-based option
#We can also open the datasheet using code:

#1.	We first set the directory. When it is the first time and we do not know the 
#directory as yet, we go to Session --> Set Working Directory --> Choose Directory. 
#Then we find the folder the datasheet is in.
#2.Once we select this directory, it will run the code of this in the console 
#automatically. I recommend you copy the directory address and add it to your 
#console. Then you will always have it available.
#3.	Once it is available, you can just run the code.

########SET THE DIRECTORY:
setwd()

#4.	Thereafter, you can tell R to identify and add the data sheet to the 
#environment. It will be in data frame format.

########READ THE CSV FILE IN:
Aug2021=read.csv("") 

#We will only work with .csv format in this workshop. But you can read in other 
#types of datasheets, e.g, excel .xls files can be reads using the read.table() 
#function. 

#We will now explore this dataset saved as an object called Aug2021.

########EXPLORE THE DATASET:

#We can see all the column names in the August dataset:


#We can view just the first 5 rows of the August dataset:
#########CODE HERE:


#We can view just the last 5 rows of the August dataset:
#########CODE HERE:


#We can identify the number of columns in the August dataset:
#########CODE HERE:

#Is there another way to know this information?
  
#We can identify the number of rows of the August dataset:
#########CODE HERE:

#This is a surprisingly useful tool

#We can get a summary of the entire dataset:
#########CODE HERE:



#We have brought in data for August 2021, we will also bring in data for 
#September 2021 and combine the two:

########READ IN THE CSV:
Sept2021=read.csv("WaterbodyData_Sep2021")


#We can then combine these two datasets as they have exactly the same columns.

########COMBINE THE DATASETS:


#let's clean the environment again. Do you remember where the broom is?

####Exercise 4: Subsetting datasets in R####
########SET THE DIRECTORY:
setwd()

########READ IN THE CSV CALLED YearSurvey_Aug21Jul22.csv:
Year_data=read.csv("YearSurvey_Aug21Jul22.csv")

########EXPLORE THE DATASET:


#This dataset has the waterbody sheets of all twelve surveys months together in 
#one dataset (nrow= 1308).  We are going to use the skill of subsetting 
#(isolating the data of interest) to answer scientific questions. 

#There are two main ways of subsetting using base R, which we will learn today. 
#Tomorrow we will learn other ways (using a set of packages called Tidyverse). 

#########SUBSET BY ROWS AND COLUMNS i.e. indexing
#1.	You can subset by isolating specific columns or rows. I do not use this very 
#often, but it is still a good skill to have. We can identify specific rows or 
#columns by using the square bracket “[]” and a comma “,”. 
#2.	You enter the data frame name, followed by the square brackets. The square 
#brackets contain the informaion on rows or columns. 


#3.	Numbers before a comma, tell us the row numbers to isolate:
#########CODE HERE:


#4.	Numbers after a comma, tell us the columns numbers to isolate:
#########CODE HERE:



#5.	You can isolate certain rows and certain columns:
#########CODE HERE:

#While can be useful in some cases, it requires you to know the number of 
#columns and rows of interest. You can instead use the name of the column to 
#isolate columns of interest
#########CODE HERE:



#########SUBSETTING BY CRITERIA using the subset() function

#You can subset by isolating rows that meet certain criteria. I use this quite 
#often with our dataset. You can use these symbols to define criteria:

# >	example: all waterbodies larger than 10m long dimension
# < 	example: all waterbodies smaller than 10m long dimension
# ==	example: all waterbodies that are equal to 10m dimension
# & 	example: all waterbodies larger than 10m long dimension and in Busega
# | 	example: all waterbodies larger than 10m long dimension or deeper than 1m

# >=	example: all waterbodies larger than or equal to 10m long dimension
# <=	example: all waterbodies smaller than or equal to 10m long dimension

# !=	example: all waterbodies not equal to 10m long dimension


#1. larger than
#########CODE HERE:

#which surveys have waterbodies larger than 10m?

#2. smaller than
#########CODE HERE:

#which surveys have waterbodies smaller than 10m?

#3. equal to
#########CODE HERE:

#which surveys have waterbodies are exactly 10m?

#########CODE HERE:

#which surveys have waterbodies in Busega?

#4. and
#########CODE HERE:

#which surveys in Busega have waterbodies larger than 10m?

#5. or
#########CODE HERE:

#which surveys in Busega have waterbodies larger than 10m or deeper than 1m?

#6. larger than or equal to
#########CODE HERE:

#which surveys have waterbodies larger or equal to than 10m?

#7. smaller than or equal to
#########CODE HERE:

#which surveys have waterbodies smaller or equal to than 10m?

#7. not equal to
#########CODE HERE:

#which surveys were not in Busega?


##Adding in mathematical functions to subsets to answer questions
#Now we can add mathematical functions to subsetted data in order to answer 
#questions of interest.


#Question 1: In what percentage of water body surveys were snails found?
#We will subset the data to only include surveys that have snails in them, that 
#is rows where snail number is larger than 0 and save it as the object “snailWB”. 

#########CODE HERE:


#We see from the global environment that the object called SnailWB has 754 rows, 
#i.e. 754 surveys have snails. We know that the full data set has 1308 rows. So, 
#we could just use R as a calculator to get the proportion of total surveys that 
#have snails:

#########CODE HERE:


#We could also ask R how many rows each of these objects has and calculate the 
#proportion through a simple equation:
#########CODE HERE:


#We could even go one step further and replace the object of snailWB by the 
#function it is defined by:
#########CODE HERE:



#Question 2: How many waterbody surveys are there in Busega?
#########CODE HERE:





#Question 3: What is the largest water body in March 2022
#########CODE HERE:



#Question 4: How many water bodies are flooded are in March?
#########CODE HERE:




#Question 5: How many waterbodies are there in Busega?
#########CODE HERE:


