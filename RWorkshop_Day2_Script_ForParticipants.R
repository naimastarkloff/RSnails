###R INTENSIVE WITH SNAIL DYNAMICS DATASET----DAY 2###

#install and load necessary packages:
install.packages('tidyverse')
library(tidyverse)

####EXERCISE 1: Recap of subsetting + introduction to Piping####
#We will use the same dataset as we used at the end of the day yesterday

#We will start by opening the same dataset. We have to set our directories 
#and read in the .csv file. 
setwd()
Year_data=read.csv("YearSurvey_Aug21Jul22.csv")


#We are going to focus on just Lambo la Mwabasabi to start. This time you will 
#isolate just surveys from Lambo la Mwabasabi using the subset() function and 
#saving it as its own datafame:

######STEP1: ISOLATE JUST THE ROWS IN LAMBO LA MWABASABI: 


#Question: How many months are snails aestivating for in L. la Mwabasabi?
#How can we approach this? What information about the waterbody would tell you 
#that snails are aestivating?



#Question: How many months is Lambo la Mwabasabi dry for?

######STEP2: ISOLATE ROWS WHERE WATER BODY IS DRY:



#So, we find it is dry for 0 months. Does this mean that snails are not 
#aestivating in Lambo la Mwabasabi?

######STEP3: ISOLATE ROWS WHERE WATER BODY IS LOW AND HAS 0 SNAILS:



#We can also write code that accounts for both cases (dry or low with 0 snails). 
subset(Mwaba_data, Water_level=="Dry"|Water_level=="Low" & Bulinus_Number_Collected==0)


#We now have code to answer Question 1: How many months are snails aestivating 
#for in Lambo la Mwabasabi? 

#But what about all waterbodies in Busega?

#Let’s start by isolating just water body surveys in Busega:
######ISOLATE ROWS OF SURVEYS DONE IN BUSEGA:



#Then we can isolate water bodies that are in Busega and are dry:
######ISOLATE WATER BODIES THAT ARE IN BUSEGA AND ARE DRY:



#But we also want the surveys where water bodies are low and have 0 snails
#####ISOLATE WATERBODIES THAT ARE IN BUSEGA AND ARE DRY OR ARE IN BUSEGA AND 
####HAVE 0 SNAILS



#So now we have a list of rows of waterbody surveys where snails are aestivating. 
#But in order to find the number of months for each waterbody, we would need to 
#count the number of surveys for each waterbody. This would take a while!

####ADVANCED CODING####
#You could also get the same dataset by subsetting from Year_data:
busega_aestdata=subset(Year_data, District=="Busega" & Water_level=="Dry"|District=="Busega" & Water_level=="Low" & Bulinus_Number_Collected==0)
####

#So, we are going to try a new tool using the new packages we installed. 
#We are going to try the technique called piping. 

#let's try piping;
#This allows us to create a sequence of multiple functions. This will make your 
#code shorter and allow you to use more intuitive functions. 

#For example, you can go through this sequence in one line of code:
#1.	subset your data to only surveys in Busega and those that are dry or 
#low with 0 snails
#2.	Group surveys by water body
#3.	Count the number of surveys

#We make use of the piping symbol "%>%" between each of these functions. 
#Following a pipe, the next line of code could go to the next script line. 
#This makes it easier for us to work with it.

######WRITE OUT SCRIPT TO PIPE DATA:


#We will want to rename the new column that contains the number of dry months as 
#it was automatically saved as “n”. Here are three ways of renaming columns. The 
#first two are with base R and the last using tidyverse. 

######RENAME THE COLUMN
names(Busega_Aest)[colnames(Busega_Aest)=="n"] = "AestMonths"
names(Busega_Aest)[2]="AestMonths"

Busega_Aest=rename(Busega_Aest, AestMonths=n)

#We can look in the variation in the number of months that a water body is dry 
#for in a year using a histogram

#####PUT IN CODE FOR THE hist() FUNCTION:


####EXERCISE 2: Joining####

#QUESTION: Do the number of months a water body has aestivation affect the 
#number of snails collected in a year? 
#QUESTION: Do the number of months a water body has aestivation affect the
#number infected snails?

#In the last exercise you created a dataset with only waterbodies in Busega and 
#the number of aestivation months. I am also giving you a dataset with all the 
#water bodies in Busega and the number of infected snails identified across the 
#12 survey months.

##We will read in this dataset and take a look at it:
Bus_Snails=read.csv("Busega_snails.csv")

###this data set has the total snail numbers and infection numbers per water body 
#in Busega

#Question: Why does the Bus_Snails dataset have 21 rows and the Busega_Aest 
#have 16 rows?

#We can combine two data sets by using the full_join() function. The function 
#will find all the unique water bodies across both data sets as rows and then 
#add all columns from both datasets. If some column data is missing for a row, 
#it will insert an “NA”:
#####INSERT CODE TO JOIN TWO DATA SETS


#waterbodies with NA in the AestMonths column did not have aestivation. This is
#the same as 0 months of aestivation. So we can replace the NA with 0
all_busega1$AestMonths[is.na(all_busega1$AestMonths)] <- 0 

#We can use the anti_join() function to find out which water bodies are present 
#in one data set and not the other. The first data set you enter is the reference 
#data set, i.e. R will see what water bodies are present in the reference data set 
#but not in the other data set. So lets start with Bus_snails first as we know 
#there are more water bodies in this data set:

#####CODE HERE FOR anti_join() STARTING WITH Bus_Snails:


#We can see that 5 waterbodies were in Bus_Snails, but not in Busega_Aest. 
#These 5 water bodies do not have aestivation.

#####CODE HERE FOR anti_join() STARTING WITH Busega_aest:


#When we start with Busega_Aest first, there is an error message. This is because 
#all waterbodies in this dataset are also in Bus_Snails.

#####ADVANCED CODING####
#You may only want to create a joined dataset that only has water bodies from one 
#dataset, and to ignore any extra water bodies in the second dataset. For 
#example, maybe you only want waterbodies that have aestivation. If so, you can 
#use the left_join() function and enter the dataset of interest first:

all_busega2=left_join(Busega_Aest, Bus_Snails,by="Waterbody")

####

#Let’s see now if the number of months of aestivation affects the number of 
#snails and number of infected snails The plot() function creates a scatter plot 
#and the abline(lm()) function (this is a complex double function) adds a line 
#of best fit. 

##FORMAT: plot(dependent variable~independent variable)
######CODE HERE TO PLOT SNAIL NUMBER BY AESTIVATION MONTHS:



abline(lm(all_busega1$SnailNumber~all_busega1$AestMonths))

######CODE HERE TO PLOT INFECTED SNAIL NUMBER BY AESTIVATION MONTHS:



abline(lm(all_busega1$InfectedSnails~all_busega1$AestMonths))

####EXERCISE 3: summary analyses####
#Summary statistics are used to quickly summarize and get information about the 
#dataset. This is greatly assisted by using the piping tool you already learned. 
#We will make use of two summary statistics functions today:
#1.	count()
#2.	summarise()

#The count() function allows you to count the number of rows that belong to a 
#certain category. We are going back to the Year_data dataset. Remember, in the 
#Year_data data set, each row refers to one survey. So we can count the number 
#of rows in each district and that tells use the number of surveys done per 
#district:
######INSERT CODE HERE TO COUNT THE NUMBER OF SURVEYS IN EACH DISTRICT:



#or we could count the number of surveys per water body. This should be 12 to 
#ensure that there was a full year of surveys for each waterbody
######INSERT CODE HERE TO COUNT THE NUMBER OF SURVEYS IN EACH WATERBODY:



#Uh oh! There are two water bodies that do not have 12 surveys. One was 10 and 
#another has 2. But they are the same water body and one seems to have a typo in 
#its name. We need to fix this. We will when we get to EXERCISE 4, which is for 
#data cleaning and management. 

####ADVANCED CODING####
#You can also use the group_by() function and extra pipe before the count() 
#function. This would group water bodies by a category first and then count the 
#number of rows. This can be used, for example, to count the number of waterbody 
#surveys that are dry for each water body. You would group the data set by the 
#Water_level column:
WB_waterlevel=Year_data%>%group_by(Water_level)%>%count(Waterbody)

#it is best to save complicated piped data as an object

####

#The summarise() function allows perform mathematics such as addition or finding 
#the average based on certain criteria. This method makes use of the group_by() 
#function and piping. It is best to save the output of complicated piped data 
#as an object.

#We can find the total number of snails per district. We first group the data by 
#district and then use summarise for the sum:

######INSERT CODE HERE TO SUM TOTAL SNAIL NUMBER IN EACH DISTRICT:



#We can find the mean number of snails per suvey for each district. We first 
#group the data by district and then use summarise for the mean:
######INSERT CODE HERE TO AVERAGE THE SNAIL NUMBER IN EACH DISTRICT:



#You can also group by two columns. So, then we get the sum of snails per 
#district and per phase
######INSERT CODE HERE TO SUM TOTAL SNAIL NUMBER IN EACH DISTRICT AND PHASE:



#Or the average snail number per district and per phase
######INSERT CODE HERE TO AVERAGE THE SNAIL NUMBER IN EACH DISTRICT AND PHASE:



#####ADVANCED CODING####
#You can also pipe in a subset, if you want to find out a summary for just a 
#certain group of surveys. For example, if you want to know the number of snails 
#per phase of only waterbodies in the district of Kwimba. Remember there are 
#many ways to do things in R, so rather than subsetting, you can also use a 
#function called filter() to only isolate surveys of interest.
Kwimba_sum=subset(Year_data,District="Kwimba")%>%
            group_by(Phase)%>%summarise(totalsnails=sum(Bulinus_Number_Collected))

Kwimba_sum=Year_data%>%filter(District=="Kwimba")%>%
  group_by(Phase)%>%summarise(totalsnails=sum(Bulinus_Number_Collected))
####


####EXERCISE 4: Data Cleaning and management####
#As we saw from the error with a waterbody being misspelled, often we must 
#correct errors in the data. So, let’s go back and check on what was incorrect:
Year_data%>%count(Waterbody)

# We can see that Lambo la Ng’wiza has two entries and one has an additional 
#space at the end. Also, there are a total of 110 water bodies. Is this the 
#correct number?

#This sort of error happens often because human error. That’s alright, there are 
#easy ways to fix it. We can use the str_replace() function to find a string of 
#characters and replace it with a new string of characters
####INSERT CODE HERE TO DETECT AND CORRECT THE ERROR:


#So, we replace the water body name with a space with one without a space. And 
#it will do this in all cells where this is occurring. Remember there were two 
#incorrectly named waterbodies. You can now check if this is corrected: 

Year_data%>%count(Waterbody)
#There are now only 109 waterbodies and no doubled name for Lambo la Ng’wiza.

#Adding a space after a waterbody name is actually a very common error, so you 
#can set up a line of code just in case other mistakes may happen. You can use 
#str_replace() to look for a space at the end of a waterbody name and replace it 
#with no space

####INSERT CODE HERE TO DETECT AND CORRECT SPACES AT THE END OF A NAME:



#You can also create new columns of data from the columns that already exist. Three functions to do this are:
#1.	unite()
#2.	separate()
#3.	mutate()

#The unite() function can be used to merge the information in two columns. For 
#example, you may want the name of the water body to also include the district.
#You enter the new column name first in "" and the names of the existing columns 
#that you want to merge. You also provide the symbol that will separate the two 
#names (for example: sep="_") and whether you can to remove (remove=T) or keep 
#(remove=F) the two original columns in the data set.
####INSERT CODE HERE TO UNITE TWO COLUMNS:
Year_data= Year_data %>% 
  unite("District_Waterbody", District, Waterbody, sep="_",remove=F)



#Open the Year_data dataset and see where the new column is. The unite() 
#function usually puts it close to the old columns.

#The separate() function can be used to separate the information in one column 
#into two columns. For example, you may want to separate the month and year in 
#the phase column. You enter the old column name that you want to separate first 
#and then names of the new columns in "". You will provide a symbol that tells us 
#how to separate the data in the column (for example: sep= "_") and whether you 
#can to remove (remove=T) or keep (remove=F) the original column in the dataset.
####INSERT CODE HERE TO SEPARATE A COLUMN INTO TWO:
Year_data= Year_data %>% 
  separate(Phase, c("Month", "Year"),sep="_", remove=F)



#Open the Year_data dataset and see where the new columns are. The separate() 
#function usually puts them close to the old column.

####ADVANCED CODING####
#Yesterday, we calculated prevalence for surveys in Lambo la Mwabasabi and looked 
#at how prevalence changed over time. We made a new column using this code:
Mwaba_data$SchistoPrev=Mwaba_data$InfectedSnails/Mwaba_data$SnailNumber

#We make use of the mutate function to do this in a similar way for the 
#Year_data data set:
Year_data=Year_data%>%
  mutate(SchistoPrev=Infected_Bulinus_Number/Bulinus_Number_Collected)

#Open the Year_data dataset and see where the new column is. The mutate() 
#function usually puts them at the end of the dataset.

#You have created a new column named “SchistoPrev” which has the outcome for 
#each row of the infected snail number divided by the total snail number. You 
#might recall that last time we calculated prevalence, “NaN” was put into the 
#new rows when there were no snails scooped in that survey. We can also see “NaN” 
#in the new column we just created in Year_data.

#The mutate function is useful because you can do different mathematical functions 
#for different rows by incorporating the case_when() function into the mutate() 
#function. This was we can tell R that in cases where the total snail number is 
#0, that the prevalence should be 0. And cases where the snail number is not 0, 
#then the calculation should happen as normal. 

Year_data=Year_data%>%
  mutate(SchistoPrev=case_when(Bulinus_Number_Collected!=0~Infected_Bulinus_Number/Bulinus_Number_Collected,
                               Bulinus_Number_Collected==0~0))

#Here is another example of using case_when() within the mutate() function. We 
#can create a new column where surveys with infected snails are marked as 
#“Infected” and surveys without infected snails are marked “Uninfected”
Year_data=Year_data%>%
  mutate(InfectedSurvey=case_when(Infected_Bulinus_Number>0~"Infected",
                                  Infected_Bulinus_Number==0~"Uninfected"))
  
#Here is an example that uses the str_detect() and case_when() functions to 
#detect the presence of a string of characters and if it is present carries out 
#a certain outcome in a new column. Here, we are looking for the string “2021” 
#in the Phase column and if present putting the number 2021 in the new column 
#named “Year2”. Alternatively, we are looking for the string “2022” in the Phase 
#column and if present putting the number 2022 in the new column named “Year2”.     
Year_data=Year_data%>%
  mutate(Year2 = case_when(str_detect(Phase, "2021") ~2021,
                          str_detect(Phase, "2022") ~2022))
####

####EXERCISE 5: graphing with ggplot2####
#The last specific set of skills we are learning in this workshop is to visually 
#represent our data, so it is easy to interpret. The ggplot2 package makes really 
#nice graphs. We will return to our dataset this morning called “all_busega1”
#that look at the number of months water bodies in Busega are undergoing aestivation 
#for and look at the number of snails in that waterbody through a year’s survey. 
#Last time we graphed it using this format:

plot(all_busega1$SnailNumber~all_busega1$AestMonths)
##FORMAT: plot(dependent variable~independent variable)

#In ggplot2 the coding structure is a bit different:
##ggplot format: ggplot(dataframename, aes(x= , y=,))+ graphtype()

######PLOT A GGPLOT2 SCATTER PLOT WITH SNAIL NUMBERS:


#Similar to piping, you can hit enter to move the code to the next line if you 
#use a “+” and R will include the next line of code when it runs it.

#We can also look at the pattern of infected snails by number of aestivation months
######PLOT A GGPLOT2 SCATTER PLOT WITH INFECTED SNAIL NUMBERS:


#The package ggplot2 is really nice to work with as you can just add more details 
#to make a more complicated graph. It is useful to save the simplest version of 
#the graph as an object that you can then add more to. We will just be working 
#with the SnailNumber data for the rest of the section. Save the graph code as 
#an object and open the object to see the graph
######PLOT AND SAVE A GGPLOT2 SCATTER PLOT WITH SNAIL NUMBERS:




#Thereafter we can add aesthetic information such as a line of best fit using 
#the geom_smooth() function
######PLOT A GGPLOT2 SCATTER PLOT WITH SNAIL NUMBERS AND A LINE OF BEST FIT:



#And we can edit the x and y axes of the graph using the xlim() and ylim() functions
######CHANGE THE X AND Y AXES OF THE LAST PLOT



#The changed axes are not very helpful so we will go back to the graph without them:
graph+geom_smooth(method="lm")

#We can also change the names of the axes using the labs() function
######ADD X AND Y AXIS LABELS TO THE PLOT:



#We can also add a name for the graph within the labs() function
######ADD X AND Y AXIS LABELS AND A TITLE TO THE PLOT:



#Lastly, we can change the color and of the points shapes in the graph by adding 
#extra information to the geom_point() function
######CHANGE THE COLOR AND SHAPE OF THE POINTS



######SAVE THIS NEW GRAPH AS "graph2":


#We can then add a line of best fit to graph2 suing the geom_smooth() function 
#and change the color and thickness of the line within the ().
######CHANGE THE COLOR AND THICKNESS OF THE LINE OF BEST FIT:



