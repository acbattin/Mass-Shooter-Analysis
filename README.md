# Mass-Shooter-Analysis
Big Data Analysis project using The Violence Project database, a publicly available database containing information relating to mass shootings in the United States of America and the shooter's themselves. Using R and Python I aim to answer several questions of interest.

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
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/FrequencyCrisis.png?raw=true" width="600" height="150"/>
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
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/FrequencySuicidality.png?raw=true" width="600" height="150"/>
</p>

As confirmed in the table above and column chart below, the total count of mass shooters in the United States that was the highest was for the group of perpetrators that intended to die in the shooting but had no previous suicidality, though not by a significant margin 

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/SuicidalityBarCounts.png?raw=true" width="500" height="500"/>
</p>

In order to capture Perpetrators with suicidal ideations in observations, I used RStudio to create a new variable-level Evidence calculated by combining the two variable-levels “1” and “2” i.e., those that were not explicitly reported as exhibiting No Evidence of Suicidality. The perpetrators that exhibited suicidal ideation prior to the shooting and the perpetrators that intended to die in the shooting are both defining characteristics of Evidence of Suicidality. With this new variable Evidence, we then created a column chart that displays the total count of mass shooters in the US that exhibited any signs of suicidal behavior compared to those who showed no evidence of seeking out traditional suicide as well as suicide by law enforcement.

# Suicidality (Adjusted to better identify Perpetrators that are more likely to be unaffected by armed-security, threat of death, etc.)
By grouping two of the three levels, as we discuss above, we can employ RStudio and write R code that generates the following descriptive statistics and appropriate visualizations for suicidal behavior.

<p align="center">
<img src="https://github.com/acbattin/Mass-Shooter-Analysis/blob/main/FrequencySuicidality.png?raw=true" width="600" height="150"/>
</p>
