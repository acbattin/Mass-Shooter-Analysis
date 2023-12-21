#---
# title: "ABattin_AIT580 ANALYSIS Project"
# output: pdf_document
# date: "2023-03-03"
# ---
library(car)
library(AICcmodavg)
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(ggpmisc)
library(skimr)
library(caret)
library(leaps) # for step wise regression
library(gvlma)# for checking the assumtions
library(glmnet)
library(psych)
library(lattice)
library(corrplot)
# Read Project CSV into Data Frame
fullData <- read.csv("/Users/andersonbattin/Desktop/Mass Shooter/FullDatabaseViolenceProject2.csv", sep=",", header = TRUE, skip = 1)
# Summary Statistics of Full Data Set
summary(fullData)
skim(fullData)

# Variable Analysis / Exploration
# Signs of Being in Crisis Variable
# Summary Statistics
summary(fullData$SignsOfBeingInCrisis)
# Tukey's Five Number Summary for Signs of Being in Crisis
fivenum(fullData$SignsOfBeingInCrisis)
# Proportions
table(fullData$SignsOfBeingInCrisis)
prop.table(table(fullData$SignsOfBeingInCrisis))

sum(fullData$SignsOfBeingInCrisis)/nrow(fullData)
# Barplot for Signs of Being in Crisis
barplot(table(fullData$SignsOfBeingInCrisis), ylab = "Count", xlab = "Signs of Being in Crisis",
        col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Signs of Being in Crisis",
        yaxp = c(0,160,4))
legend("topleft", inset=.01, box.col = "black", title="Signs of Being in Crisis", 
       c("No Evidence","Yes")
       , border="black", fill = c("red", "blue"), bty = "0")
# Pie Chart for Signs of Being in Crisis
crisis_labels = c("No Evidence", "Evidence")
crisis_pct = round(table(fullData$SignsOfBeingInCrisis)/sum(table(fullData$SignsOfBeingInCrisis))*100)
crisis_labels = paste(crisis_labels, crisis_pct) # add percents to labels 
crisis_labels = paste(crisis_labels,"%",sep="") # ad % to labels
pie(table(fullData$SignsOfBeingInCrisis), labels = crisis_labels,
    main="Pie Chart of Signs of Being in Crisis", col = rainbow(length(crisis_labels)))



# Inability to Perform Daily Tasks Variable
# Summary Statistics
summary(fullData$InabilityToPerformDailyTasks)
# Tukey's 5 Number Summary
fivenum(fullData$InabilityToPerformDailyTasks)
# Proportions
table(fullData$InabilityToPerformDailyTasks)
sum(fullData$InabilityToPerformDailyTasks)/nrow(fullData)

# Barplot for Inability to Perform Daily Tasks
barplot(table(fullData$InabilityToPerformDailyTasks), ylab = "Count", xlab = "Inability To Perform Daily Tasks", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Inability To Perform Daily Tasks")
# Pie Chart for Inability to Perform Daily Tasks
task_labels = c("No Evidence", "Evidence")
task_pct = round(table(fullData$InabilityToPerformDailyTasks)/sum(table(fullData$InabilityToPerformDailyTasks))*100)
task_labels = paste(task_labels, task_pct) # add percents to labels 
task_labels = paste(task_labels,"%",sep="") # ad % to labels
pie(table(fullData$InabilityToPerformDailyTasks), labels = task_labels,
    main="Pie Chart of Inability to Perform Daily Tasks", col = rainbow(length(task_labels)))

# Notably Depressed Mood Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$NotablyDepressedMood)
fivenum(fullData$NotablyDepressedMood)
# Table of counts Proportions
table(fullData$NotablyDepressedMood)
sum(fullData$NotablyDepressedMood)/nrow(fullData)
# Barplot for Notably Depressed Mood
barplot(table(fullData$NotablyDepressedMood), ylab = "Count", xlab = "Notably Depressed Mood", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Notably Depressed Moods")
# Pie Chart for Notably Depressed Mood
dep_labels = c("No Evidence", "Evidence")
dep_pct = round(table(fullData$NotablyDepressedMood)/sum(table(fullData$NotablyDepressedMood))*100)
dep_labels = paste(dep_labels, dep_pct) # add percents to labels 
dep_labels = paste(dep_labels,"%",sep="") # ad % to labels
pie(table(fullData$NotablyDepressedMood), labels = dep_labels,
    main="Pie Chart of Notably Depressed Moods", col = rainbow(length(dep_labels)))

# Unusually Calm Or Happy Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$UnusuallyCalmOrHappy)
fivenum(fullData$UnusuallyCalmOrHappy)
# Table of Counts and calculation for proportions
table(fullData$UnusuallyCalmOrHappy)
sum(fullData$UnusuallyCalmOrHappy)/nrow(fullData)
# Barplot for Unusually Calm Or Happy
barplot(table(fullData$UnusuallyCalmOrHappy), ylab = "Count", xlab = "Unusually Calm Or Happy", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Unusually Calm Or Happy")
# Pie Chart for Unusually Calm Or Happy
calm_labels = c("No Evidence", "Evidence")
calm_pct = round(table(fullData$UnusuallyCalmOrHappy)/sum(table(fullData$UnusuallyCalmOrHappy))*100)
calm_labels = paste(calm_labels, calm_pct) # add percents to labels 
calm_labels = paste(calm_labels,"%",sep="") # ad % to labels
pie(table(fullData$UnusuallyCalmOrHappy), labels = calm_labels,
    main="Pie Chart of Unusually Calm Or Happy", col = rainbow(length(calm_labels)))


# Rapid Mood Swings Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$RapidMoodSwings)
fivenum(fullData$RapidMoodSwings)
# Proportions
table(fullData$RapidMoodSwings)
sum(fullData$RapidMoodSwings)/nrow(fullData)
# Barplot for Rapid Mood Swings
barplot(table(fullData$RapidMoodSwings), ylab = "Count", xlab = "Rapid Mood Swings", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Rapid Mood Swings")
# Pie Chart for Rapid Mood Swings
mood_labels = c("No Evidence", "Evidence")
mood_pct = round(table(fullData$RapidMoodSwings)/sum(table(fullData$RapidMoodSwings))*100)
mood_labels = paste(mood_labels, mood_pct) # add percents to labels 
mood_labels = paste(mood_labels,"%",sep="") # ad % to labels
pie(table(fullData$RapidMoodSwings), labels = mood_labels,
    main="Pie Chart of Rapid Mood Swings", col = rainbow(length(mood_labels)))


# Increased Agitation Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$IncreasedAgitation)
fivenum(fullData$IncreasedAgitation)
# Proportions
table(fullData$IncreasedAgitation)
prop.table(table(fullData$IncreasedAgitation))
sum(fullData$IncreasedAgitation)/nrow(fullData)
# Barplot for Increased Agitation
barplot(table(fullData$IncreasedAgitation), ylab = "Count", xlab = "Increased Agitation", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Increased Agitation")
# Pie Chart for Increased Agitation
ia_labels = c("No Evidence", "Evidence")
ia_pct = round(table(fullData$IncreasedAgitation)/sum(table(fullData$IncreasedAgitation))*100)
ia_labels = paste(ia_labels, ia_pct) # add percents to labels 
ia_labels = paste(ia_labels,"%",sep="") # ad % to labels
pie(table(fullData$IncreasedAgitation), labels = ia_labels,
    main="Pie Chart of Increased Agitation", col = rainbow(length(ia_labels)))

# Abusive Behavior Variable


# Isolation Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$Isolation)
fivenum(fullData$Isolation)
# Proportions
table(fullData$Isolation)
prop.table(table(fullData$Isolation))
sum(fullData$Isolation)/nrow(fullData)
# Barplot for Isolation
barplot(table(fullData$Isolation), ylab = "Count", xlab = "Isolation", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Isolation",
       ylim = c(0, 120))
# Pie Chart for Isolation
iso_labels = c("No Evidence", "Evidence")
iso_pct = round(table(fullData$Isolation)/sum(table(fullData$Isolation))*100)
iso_labels = paste(iso_labels, iso_pct) # add percents to labels 
iso_labels = paste(iso_labels,"%",sep="") # ad % to labels
pie(table(fullData$Isolation), labels = iso_labels,
    main="Pie Chart of Isolation", col = rainbow(length(iso_labels)))

# Losing Touch With Reality Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$LosingTouchWithReality)
fivenum(fullData$LosingTouchWithReality)
# Proportions
table(fullData$LosingTouchWithReality)
sum(fullData$LosingTouchWithReality)/nrow(fullData)
# Barplot for Losing Touch With Reality
barplot(table(fullData$LosingTouchWithReality), ylab = "Count", xlab = "Losing Touch With Reality", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Losing Touch With Reality")
# Pie Chart for Losing Touch With Reality
ltr_labels = c("No Evidence", "Evidence")
ltr_pct = round(table(fullData$LosingTouchWithReality)/sum(table(fullData$LosingTouchWithReality))*100)
ltr_labels = paste(ltr_labels, ltr_pct) # add percents to labels 
ltr_labels = paste(ltr_labels,"%",sep="") # ad % to labels
pie(table(fullData$LosingTouchWithReality), labels = ltr_labels,
    main="Pie Chart of Losing Touch With Reality", col = rainbow(length(ltr_labels)))

# Paranoia Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$Paranoia)
fivenum(fullData$Paranoia)
# Proportions
table(fullData$Paranoia)
sum(fullData$Paranoia)/nrow(fullData)
# Barplot for Paranoia
barplot(table(fullData$Paranoia), ylab = "Count", xlab = "Paranoia", col = c("red","blue"),
        names.arg = c("No Evidence", "Evidence"), main = "Total Counts of Paranoia")
# Pie Chart for Paranoia
par_labels = c("No Evidence", "Evidence")
par_pct = round(table(fullData$Paranoia)/sum(table(fullData$Paranoia))*100)
par_labels = paste(par_labels, par_pct) # add percents to labels 
par_labels = paste(par_labels,"%",sep="") # ad % to labels
pie(table(fullData$Paranoia), labels = par_labels,
    main="Pie Chart of Paranoia", col = rainbow(length(par_labels)))


# Mental Health Variables: Suicidality, Prior Hospitalization, 
# Voluntary or Involuntary Hospitalization, Prior Counseling
# Suicidality Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$Suicidality)
fivenum(fullData$Suicidality)
# Proportions
table(fullData$Suicidality)
sum(fullData$Suicidality)/nrow(fullData)
prop.table(table((fullData$Suicidality)))
# Barplot for Suicidality
barplot(table(fullData$Suicidality), ylab = "Count", xlab = "Suicidality",
        col = c("pink", "darkorange", "darkgreen"), names.arg = c("No Evidence",
            "Evidence Before Shooting", "Intended to Die in Shooting"),
        main = "Total Counts of Suicidality", ylim = c(0,80))
        
legend("topleft", inset=.01, box.col = "black", title="Levels of Suicidality", 
       c("No Evidence","Evidence Before Shooting","Intended to Die in Shooting")
       , border="black", fill = c("pink", "darkorange", "darkgreen"), bty = "0")
       
suic = table(fullData$Suicidality)

suic = c(57, 131) # No Evidence = 57, Evidence = 131
barplot(suic, beside = TRUE, ylab = "Count", xlab = "Suicidality", col = c("pink", "lightgreen"),
        names.arg = c("No Evidence", "Evidence"), main = 
          "Counts of Suicidal Behavior", ylim = c(0, 140))
legend("topleft", inset=.01, box.col = "black", title="Levels of Suicidality", 
       c("No Evidence","Evidence")
       , border="black", fill = c("pink", "lightgreen"), bty = "0")

# Pie Chart for Suicidality
suic_labels = c("No Evidence","Evidence Before Shooting", "Intended to Die in Shooting")
suic_pct = round(table(fullData$Suicidality)/sum(table(fullData$Suicidality))*100)
suic_labels = paste(suic_labels, suic_pct)
suic_labels = paste(suic_labels, "%", sep = "")
pie(table(fullData$Suicidality), labels = suic_labels,
    main = "Pie Chart of Suicidality", col = c("pink","darkorange","darkgreen"))
legend("topleft", inset =-.00025, box.col = "black", 
       c("No Evidence","Evidence Before Shooting","Intended to Die in Shooting")
       , border="black", fill = c("pink", "darkorange", "darkgreen"), bty = "0")


# Prior Hospitalization Variable 
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$PriorHospitalization)
table(fullData$PriorHospitalization)
fivenum(fullData$PriorHospitalization)
# Barplot for Prior Hospitalization
barplot(table(fullData$PriorHospitalization), ylab = "Count", xlab = 
          "Prior Hospitalization for Psychiatric Reasons", col = c("hotpink3",
          "lightgreen"), names.arg = 
          c("No Evidence", "Yes"), main = "Hospitalized due to 
          Psychiatric Reasons Prior to Committing a Mass Shooting in the 
        United States (from 1966-Present)",
          yaxp = c(0, 160, 4))
legend("topright", inset=.01, box.col = "black", title="Prior Hospitalization", 
       c("No Evidence","Yes")
       , border="black", fill = c("hotpink3", "lightgreen"), bty = "0")

table(fullData$PriorHospitalization)
prop.table(table(fullData$PriorHospitalization))

# Pie Chart for Prior Hospitalization
ph_labels = c("No Evidence", "Yes")
ph_pct = round(table(fullData$PriorHospitalization)/sum(table(fullData$PriorHospitalization))*100)
ph_labels = paste(ph_labels, ph_pct)
ph_labels = paste(ph_labels, "%", sep = "")
pie(table(fullData$PriorHospitalization), labels = ph_labels, main = 
      "Hospitalized due to Psychiatric Reasons Prior to Committing a Mass 
      Shooting in the United States (from 1966-Present)", 
    col = c("hotpink3", "lightgreen"))
legend("topright", inset=.01, box.col = "black", title="Prior Hospitalization", 
       c("No Evidence","Yes")
       , border="black", fill = c("hotpink3", "lightgreen"), bty = "0")

# Voluntary Or Involuntary Hospitalization Variable
# Summary Statistics and Tukey's 5 Numbers Summary
summary(fullData$VoluntaryOrInvoluntaryHospitalization)
fivenum(fullData$VoluntaryOrInvoluntaryHospitalization)
# Barplot for Voluntary or Involuntary Hospitalization
table(fullData$VoluntaryOrInvoluntaryHospitalization) # No Evidence = 4, E = 32
prop.table(table(fullData$VoluntaryOrInvoluntaryHospitalization))
barplot(c(4,32), ylab = "Count", ylim = c(0,35),
        xlab = "Voluntary or Involuntary Hospitalization", names.arg = 
          c("Voluntary", "Involuntary"), col = c("hotpink3","lightgreen"), main = 
          "Counts of Voluntary or Involuntary Hospitalization")
legend("topleft", inset=.01, box.col = "black", title="Prior Hospitalization", 
       c("Voluntary","Involuntary")
       , border="black", fill = c("hotpink3", "lightgreen"), bty = "0")
# Pie Chart for Voluntary or Involuntary Hospitalization,PriorHospitalization
hos_labs = c("Voluntary", "Involuntary")
hos_pct = round(c(4,32)/sum(c(4,32))*100)
hos_labs = paste(hos_labs, hos_pct)
hos_labs = paste(hos_labs, "%", sep = "")
pie(c(4,32), labels = hos_labs, main = "Pie Chart for Voluntary or Involuntary
    Hospitalization", col = c("hotpink3","lightgreen"))

# Prior Counseling Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$PriorCounseling)
fivenum(fullData$PriorCounseling)
table(fullData$PriorCounseling)
prop.table(table(fullData$PriorCounseling))
# Barplot for Prior Counseling
barplot(table(fullData$PriorCounseling), ylab = "Count", xlab = 
          "Prior Counseling", names.arg = c("No Evidence", "Yes"), main = 
          "Perpetrators of Mass Shootings in the U.S. that Recieved Counseling
        Prior to Committing Their Crime (from 1966-Present)", col = c("hotpink3","lightgreen"),
        yaxp = c(0,140,4))
legend("topright", inset=.01, box.col = "black", title="Prior Counseling", 
       c("No Evidence","Yes")
       , border="black", fill = c("hotpink3", "lightgreen"), bty = "0")
# Pie Chart for Prior Counseling
coun_labs = c("No Evidence", "Yes")
coun_pct = round(table(fullData$PriorCounseling)/sum(table(fullData$PriorCounseling))*100)
coun_labs = paste(coun_labs, coun_pct)
coun_labs = paste(coun_labs, "%", sep = "")
pie(table(fullData$PriorCounseling), labels = coun_labs, main = "Pie Chart for Prior Counseling",
    col = c("hotpink3","lightgreen"))

# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$Treatment6MonthsPriorToShooting)
fivenum(fullData$Treatment6MonthsPriorToShooting)
table(fullData$Treatment6MonthsPriorToShooting)
prop.table(table(fullData$Treatment6MonthsPriorToShooting))
# Barplot for Treatment 6 Months Prior to Shooting
barplot(table(fullData$Treatment6MonthsPriorToShooting), ylab = "Count", xlab = 
          "Treatment Six Months Prior to Shooting", names.arg =
  c("No Evidence","Evidence"), main = "Perpetrators of Mass Shootings that 
Recieved Treatment Six Months Prior to Their Crime (from 1966-Present)",
col = c("hotpink3", "lightgreen"),yaxp = c(0,160,5))
legend("topright", inset=.0001, box.col = "black", title="Treatment Six Months
       Prior to Shooting",  c("No Evidence","Yes")
       , border="black", fill = c("hotpink3", "lightgreen"), bty = "0")
# Pie Chart for Treatment 6 Months Prior to Shooting
t6_labs = c("No Evidence", "Evidence")
t6_pct = round(table(fullData$Treatment6MonthsPriorToShooting)/sum(table(fullData$Treatment6MonthsPriorToShooting))*100)
t6_labs = paste(t6_labs, t6_pct)
t6_labs = paste(t6_labs, "%", sep = "")
pie(table(fullData$Treatment6MonthsPriorToShooting), labels = t6_labs, main = "Pie Chart for 
    Treatment Prior to Six Months Prior to Shooting",
    col = c("hotpink3","lightgreen"))


# Mental Illness Variable
# Summary Statistics and Tukey's 5 Number Summary
summary(fullData$MentalIllness)
fivenum(fullData$MentalIllness)
table(fullData$MentalIllness)
prop.table(table(fullData$MentalIllness))

# Barplot for Mental Illness
barplot(table(fullData$MentalIllness), ylab = "Count", xlab = "Mental Illness of
        Perpetrators of Mass Shootings", names.arg = c("No Evidence", "Mood",
        "Thought", "Other","Undiagnosed Disorder"), 
        main = "Reported Mental Illness of Perpetrators", 
        col = c("hotpink3","lightgreen","lightblue",
        "darkorange","violet"), xaxp = c(0,50,2), horiz = T)
legend("topright", box.col = "black", title = "Mental Illness 
       Category", c("No Evidence", "Mood Disorder", "Thought Disorder",
       "Other Psychiatric Disorder",  "Undiagnosed Psychiatric Disorder"), 
       border = "black", fill = c("hotpink3","lightgreen","lightblue",
        "darkorange","violet"),bty = "none")
        
# Correlation for Suicidality
tapply(fullData$Suicidality,INDEX = fullData$PriorHospitalization, FUN =
         function(x) length(x)/nrow(fullData))

#rcorr(fullData$)
prop.table()
suic_results = lm(Suicidality ~ Treatment6MonthsPriorToShooting + 
                VoluntaryOrInvoluntaryHospitalization + PriorHospitalization + 
                  MentalIllness, data = fullData)
summary(suic_results)
suic_results
# Treatment 6 Months Prior to Shooting, Voluntary or Involuntary Hospitalization
# PriorHospitalization, MentalIllness

# Linear Regression
fullData$Suicidality[fullData$Suicidality == 2] = 1
fullData$Suicidality
# Model for PriorHospitalization
ph_model <- lm(fullData$Suicidality~fullData$PriorHospitalization)
summary(ph_model)
# Residual Plots for PriorHospitalization
par(mfrow=c(2,2))
plot(ph_model,main="Residual Graphs for PriorHospitalization")

ph_graph = ggplot(fullData, aes(x = PriorHospitalization, y = Suicidality))+
  geom_point() + geom_smooth(method = "lm", col="red") + theme_bw() + 
  stat_regline_equation() + labs(title = "Log Regression for Prior Hospitalization
                                 vs. Suicidality")
ph_graph


# Model for VoluntaryOrInvoluntaryHospitalization 
vol_model <- lm(fullData$Suicidality~fullData$VoluntaryOrInvoluntaryHospitalization)
summary(vol_model)
# Residual Plots for VoluntaryOrInvoluntaryHospitalization
par(mfrow=c(2,2))
plot(vol_model,main="Residual Graphs for VoluntaryOrInvoluntaryHospitalization")

# Model for PriorCounseling
pc_model <- lm(fullData$Suicidality~fullData$PriorCounseling)
summary(pc_model)
# Residual Plots for PriorCounseling
par(mfrow=c(2,2))
plot(pc_model,main="Residual Graphs for PriorCounseling")

# Model for Treatment6MonthsPriorToShooting
treat6_model <- lm(fullData$Suicidality~fullData$Treatment6MonthsPriorToShooting)
summary(treat6_model)
# Residual Plots for Treatment6MonthsPriorToShooting
par(mfrow=c(2,2))
plot(treat6_model,main="Residual Graphs for Treatment6MonthsPriorToShooting")

# Model for Mental Illness
mi_model <- lm(fullData$Suicidality~fullData$MentalIllness)
summary(mi_model)
# Residual Plots for MentalIllness
par(mfrow=c(2,2))
plot(mi_model,main="Residual Graphs for Mental Illness")

# Prior Hospitalization, Voluntary or Involuntary Hospitalization, Prior Counseling, 
# Treatment 6 Months Prior to Shooting and Mental Illness
log_model = glm(Suicidality ~ PriorHospitalization + 
                  VoluntaryOrInvoluntaryHospitalization +
                PriorCounseling + Treatment6MonthsPriorToShooting + 
                  MentalIllness, family = binomial(link='logit'),
                data = fullData)
summary(log_model)

# Without MentallIllness
menill_model = glm(Suicidality ~ PriorHospitalization + VoluntaryOrInvoluntaryHospitalization +
                  PriorCounseling + Treatment6MonthsPriorToShooting,
                family = binomial(link='logit'),data = fullData)
summary(menill_model)

# Without Treatment6MonthsPrior
treatment_model = glm(Suicidality ~ PriorHospitalization + VoluntaryOrInvoluntaryHospitalization +
                     PriorCounseling + MentalIllness,
                   family = binomial(link='logit'),data = fullData)
summary(treatment_model)

# Without PriorCounseling 
coun_model = glm(Suicidality ~ PriorHospitalization + VoluntaryOrInvoluntaryHospitalization +
                        Treatment6MonthsPriorToShooting + MentalIllness,
                      family = binomial(link='logit'),data = fullData)
summary(coun_model)

# Without VoluntaryOrInvoluntaryHospitalization
voi_model = glm(Suicidality ~ PriorHospitalization + PriorCounseling +
                   Treatment6MonthsPriorToShooting + MentalIllness,
                 family = binomial(link='logit'),data = fullData)
summary(voi_model)

# Without Prior Hospitalization 
phos_model = glm(Suicidality ~ VoluntaryOrInvoluntaryHospitalization + PriorCounseling +
                  Treatment6MonthsPriorToShooting + MentalIllness,
                family = binomial(link='logit'),data = fullData)
summary(phos_model)
#------------------

rcorplot = cbind(fullData$Suicidality,fullData$PriorHospitalization,
            fullData$VoluntaryOrInvoluntaryHospitalization, fullData$PriorCounseling,
            fullData$Treatment6MonthsPriorToShooting, fullData$MentalIllness)
#corrplot(rcorplot)
#rcorplot
cormatrix = cor(rcorplot, method="spearman")
cormatrix
colnames(cormatrix) = c("Suicidality","PriorHospitalization",
                        "VoluntaryOrInvoluntaryHospitalization","PriorCounseling",
                        "Treatment6MonthsPriorToShooting","MentalIllness")
rownames(cormatrix) = c("Suicidality","PriorHospitalization",
                        "VoluntaryOrInvoluntaryHospitalization","PriorCounseling",
                        "Treatment6MonthsPriorToShooting","MentalIllness")
corrplot(cormatrix, method = "color", addCoef.col = "black")
print(cormatrix)