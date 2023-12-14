# Mass-Shooter-Analysis
Big Data Analysis project using The Violence Project database, a publicly available database containing information relating to mass shootings in the United States of America and the shooter's themselves. Using R and Python I aim to answer several questions of interest. The study conducted used the sixth iteration of the largest, most comprehensive source of information on the psychosocial histories of mass public shooters in the United States of America, The Violence Project Mass Shooter Database – Version 6.1, a database of mass public shootings in the United States from 1966 to Present. 

# Dataset Information
The Violence Project Database is the largest, most comprehensive source of information on the psychosocial histories of mass public shooters in the United States. It currently has over 180 independent variables and at the time of download, the reported size of the dataset is 989KB of data. Responsibility for the contents of the database lies solely with the Principal Investigators, professors Jillian Peterson (Hamline University) and James Densley (Metro State University). This project followed a research methodology that has proven effective in terrorism studies, which also are rare events that can result in mass casualties. The database was constructed using public records and open-source data.

# Questions of Interest
Three questions of interest are specified in the above dataset selection and description,
and they are numbered accordingly and are as follows:

Question 1. What (if any) Signs of Being in A Crisis were observed?

Question 2. What can be said about the mental health background of mass shooters in the United States?

Question 3. What (if any) variables are most closely correlated with Suicidality?

# What Signs of Being in a Crisis were Observed?
Calculate summary statistics for the crisis variables, present summary statistics for the following variables: Signs of Being in Crisis – table of counts/proportions for this discrete, binary variable’s values 0 and 1 where 0 indicates No Evidence and 1 indicates Yes, there was evidence of the perpetrator’s circumstances overwhelming their coping mechanisms causing a marked change in behavior from baseline. We confirm that there is no missing data and create bar chart for counts by reported level because this is a categorical, binary variable to visualize the proportion of Perpetrators that demonstrated a marked change in behavior from baseline.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/FrequencyCrisis.png?raw=true" width="600" height="125"/>
</p>

We now use RStudio to generate a column plot displaying the counts for Signs of Being in Crisis by group, Perpetrators that did not exhibit this and observations where there is no evidence of this being the case.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/CrisisBars.png?raw=true" width="500" height="500"/>
</p>

Below is a table that includes the calculated proportion of mass shooters in the United States from 1966 to present that exhibited an observable change in their baseline behavior, for each of the binary, categorical variables Inability to Perform Daily Tasks, Notably Depressed Mood, Unusually Calm or Happy, Rapid Mood Swings, Increased Agitation, Abusive Behavior, Isolation, Losing Touch with Reality, and Paranoia. In line with best practices for categorical variables, the signs are ordered by variable level with largest proportion to smallest proportion.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/BehaviorChangeTable.png?raw=true" width="600" height="300"/>
</p>

# What Can be Said About the Mental Health Background of Mass Shooters in the United States?
The health and mental health variables in the dataset are as follows: Suicidality, Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, Treatment 6 Months Prior to Shooting, and Mental Illness. The skim() function in RStudio was run and the data summary showed that no observations are missing data for any of the health and mental health variables. Suicidality is defined in the Glossary and is a categorical variable with three levels: 0 = No Evidence, 1 =Yes, at any point before the shooting, and 2 = Intended to die in shooting but had no previous suicidality. Thus, we calculate the counts and proportions in the dataset.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/FrequencySuicidality.png?raw=true" width="600" height="125"/>
</p>

As confirmed in the table above and column chart below, the total count of mass shooters in the United States that was the highest was for the group of perpetrators that intended to die in the shooting but had no previous suicidality, though not by a significant margin 

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/SuicidalityBarCounts.png?raw=true" width="500" height="500"/>
</p>

In order to capture Perpetrators with suicidal ideations in observations, I used RStudio to create a new variable-level Evidence calculated by combining the two variable-levels “1” and “2” i.e., those that were not explicitly reported as exhibiting No Evidence of Suicidality. The perpetrators that exhibited suicidal ideation prior to the shooting and the perpetrators that intended to die in the shooting are both defining characteristics of Evidence of Suicidality. With this new variable Evidence, we then created a column chart that displays the total count of mass shooters in the US that exhibited any signs of suicidal behavior compared to those who showed no evidence of seeking out traditional suicide as well as suicide by law enforcement.

 Suicidality (Adjusted to better identify Perpetrators that are more likely to be unaffected by armed-security, threat of death, etc.)
By grouping two of the three levels, as we discuss above, we can employ RStudio and write R code that generates the following descriptive statistics and appropriate visualizations for suicidal behavior.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/AdjustedSuicideTable.png?raw=true" width="600" height="125"/>
</p>

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/SuicidalEvidenceBar.png?raw=true" width="500" height="500"/>
</p>

Prior Hospitalization is a binary variable with two levels: 0 = No Evidence and 1 = Yes regarding whether the Perpetrator was hospitalized for psychiatric reasons at any point prior to the mass shooting they committed. 
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/HospitalizationBars.png?raw=true" width="500" height="500"/>
</p>

Voluntary or Involuntary Hospitalization is a categorical, numerically coded nominal variable with three levels: N/A = 0, Voluntary = 1, and Involuntary = 2. Imported into RStudio and then calculated the counts at each level for the variable and produced the following table with the R code output.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/VoluntaryInvoluntaryTable.png?raw=true" width="600" height="125"/>
</p>
Below is a column chart generated in RStudio which visualizes a subset of mass shooters, those that were hospitalized for psychiatric reasons prior to the mass shooting event, the goal of the plot is to display the difference between the number of mass shooters that were hospitalized voluntarily and the number of those that were under an involuntary hospitalization.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/VoluntaryInvoluntaryBar.png?raw=true" width="500" height="500"/>
</p>

Prior Counseling is a binary variable with only two levels: 0 = No Evidence and 1 = Yes regarding whether the Perpetrator was hospitalized for psychiatric reasons at any point prior to the mass shooting they committed. Prior Counseling is regarded as an indicator of Treatment4 by the Primary Investigators.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/CounselingTable.png?raw=true" width="600" height="125"/>
</p>
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/CounselingPlot.png?raw=true" width="500" height="500"/>
</p>


Mental Illness is a categorical, numerically coded nominal variable with five levels, as defined in The Violence Project Database codebook: 0 = No Evidence, 1 = Mood Disorder, 2 = Thought Disorder, 3 = Other Psychiatric Disorder, 4 = Undiagnosed Psychiatric Disorder. There is no missing data for the variable, which is the first thing we check. We use RStudio to calculate a frequency table and the number of counts per level.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/MentalIllnessTable.png?raw=true" width="600" height="200"/>
</p>
We use R to generate a bar plot and follow good visualization practices to properly display the differing reported mental illness status of Perpetrators of mass public shootings in the U.S. since 1966. 
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/MentalIllnessofPerp.png?raw=true" width="600" height="500"/>
</p>
The bar plot above for Mental Illness levels displays the total count of perpetrators reported at each level of the categorical variable Mental Illness. We can see that the least represented group are the perpetrators with an “Other Psychiatric Disorder” as it is more than 75% less than every other variable group.

# What (if any) health and mental health-related variables are most closely correlated with Suicidality?
Below is a correlation plot generated in RStudio for the health and mental health variables.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/CorPlot.png?raw=true" width="600" height="600"/>
</p>

The response variable is binary, indicating whether the Perpetrator displayed Suicidality and in order to estimate the relationship between this variable type and other independent health and mental health-related variables, Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, Treatment 6 Months Prior to Shooting and Mental Illness, is by creating a model.
In RStudio, we conduct logistic regression where Suicidality is our binary explanatory variable. These models are written and generated in RStudio to predict Suicidality with independent, explanatory variables Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, Treatment 6 Months Prior to Shooting and Mental Illness. We generate and test these models in R and determine the model with the lowest AIC does not include the Mental Illness variable but still includes the other health and mental illness variables Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, Treatment 6 Months Prior to Shooting. The p- value for Prior Counseling in this model is p = 0.02496 which indicates that it is a statistically significant predictor variable because it is less than 0.05. The AIC for this model is 233.13. A screenshot of the model and R Console output is provided below:
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/RConsoleModel.png?raw=true" width="600" height="600"/>
</p>

# Concluding Remarks
Using RStudio we can calculate the proportion of observations that have the “Yes” flag for each of the crisis signal variables which are binary, categorical variables. I calculated the proportion of observations that indicated a marked change in their behavior. It is interesting to note that because these are binary variables i.e., because the variables below are coded as 0 (No Evidence) and 1, the proportion is equal to the mean.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/Q1Table.png?raw=true" width="600" height="200"/>
</p>

The five different levels reported for mental illness capture the fact that only 21.81% of Perpetrators of mass shooters exhibited no evidence whatsoever of a mental illness, diagnosed or not. The proportion of Perpetrators with Mood Disorders is equivalent to the proportion of Perpetrators with an Undiagnosed Psychiatric Disorder, their totals being marginally lower than the group of Perpetrators with a Thought Disorder, less than 2%.
<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/Q2Table.png?raw=true" width="600" height="200"/>
</p>

The variable Prior Counseling is the health and mental health variable measure most correlated with Suicidality. The correlation matrix and correlation plot allowed us to test for collinearity as well as aim to identify whether the response variable Suicidality was correlated with any of the health or mental health variables we explore and analyze on a deeper level in answering the question prior (Question 2). The total count of perpetrators that did not exhibit any evidence of suicidality was more than two times less than the total count of Perpetrators that exhibited any suicidal tendencies.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/SuicidebyCounseling.png?raw=true" width="500" height="500"/>
</p>
The model with the lowest AIC is the model excluding the Mental Illness variable, with an AIC of 233.13. This model includes the explanatory health and mental illness variables Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, Treatment 6 Months Prior to Shooting. The p-value for Prior Counseling in this model is p = 0.02496 which indicates that it is a statistically significant predictor variable because it is less than 0.05.
