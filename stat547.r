# Repeated CD4 counts data from AIDS clinical trial.
# 
# Source: AIDS Clinical Trial Group 193A Study. 
# Data courtesy of Dr. Keith Henry.
# 
# Reference: Henry, K., Erice, A., Tierney, C., Balfour, H.H. Jr, Fischl, M.A.,
# Kmack, A., Liou, S.H., Kenton, A., Hirsch, M.S., Phair, J., Martinez, A. 
# and Kahn J.O. for the AIDS Clinical Trial Group 193A Study Team (1998). 
# A randomized, controlled, double-blind study comparing the survival benefit of 
# four different reverse transcriptase inhibitor therapies (three-drug, two-drug,
#                                                           and alternating drug) for the treatment of advanced AIDS. Journal of Acquired 
# Immune Deficiency Syndromes and Human Retrovirology, 19, 339-349.
# 
# 
# Description:
#   
#   The data are from a randomized, double-blind, study of AIDS patients with 
# advanced immune suppression (CD4 counts of less than or equal to 50 cells/mm^3).
# Patients in AIDS Clinical Trial Group (ACTG) Study 193A were randomized to 
# dual or triple combinations of HIV-1 reverse transcriptase inhibitors. 
# Specifically, patients were randomized to one of four daily regimens containing
# 600mg of zidovudine: zidovudine alternating monthly with 400mg didanosine;
# zidovudine plus 2.25mg of zalcitabine; zidovudine plus 400mg of didanosine; 
# or zidovudine plus 400mg of didanosine plus 400mg of nevirapine (triple therapy). 
# Measurements of CD4 counts were scheduled to be collected at baseline and at 
# 8-week intervals during follow-up. However, the CD4 count data are unbalanced 
# due to mistimed measurements and missing data that resulted from skipped visits
# and dropout. The number of measurements of CD4 counts during the first 40 
# weeks of follow-up varied from 1 to 9, with a median of 4. 
# The response variable is the log transformed CD4 counts, log(CD4 counts + 1), 
# available on 1309 patients.
# The categorical variable Treatment is coded 1 = zidovudine alternating monthly 
# with 400mg didanosine, 2 = zidovudine plus 2.25mg of zalcitabine, 3 = zidovudine
# plus 400mg of didanosine, and 4 = zidovudine plus 400mg of didanosine plus 
# 400mg of nevirapine. The variable Week represents time since baseline (in weeks).
# 

#Variable List: Subject ID, Treatment, Age (years), Gender (1=M, 0=F), Week, log(CD4 count + 1).
library(ggplot2)
cd4 <- read.table("http://www.hsph.harvard.edu/fitzmaur/ala/cd4.txt", skip = 40)
colnames(cd4) <- c("id", "trt", "age", "gender", "week", "logcd4")
cd4$id <- as.factor(cd4$id)
cd4$gender <- as.factor(cd4$gender)
cd4$trt <- as.factor(cd4$trt)
levels(cd4$gender) <- c("F", "M")
ggplot(cd4, aes(x = week, y = logcd4, group = id, colour = gender)) + 
  geom_line() +
  facet_wrap(~trt, ncol= 2)



## Task 1: principle component analysis for each treatment group curves####
head(cd4)
ggplot(cd4, aes(x = week, y = logcd4, group = id, colour = trt)) + geom_line()

## Task 2: ANOVA model for treatment effects. ######