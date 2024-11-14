# install the libraries 
#install.packages('reticulate') 
#install.packages("ggstatsplot")
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("janitor")

# Load the libraries
library(reticulate)
library(ggstatsplot)
library(ggplot2)
library(dplyr)
library(janitor)
library(readr)

# Load the dataset
hs_data1 = read.csv('D://Download//Project 3 For Porfolio Data//realtor-data.zip.csv//realtor-data.zip.csv')
hs_data2 = read.csv('D://Download//Project 3 For Porfolio Data//Project 3 porfolio data - Sheet1.csv')

df <- merge(x=hs_data1,y=hs_data2,  #Left Join
             by='state', all.x=TRUE)

#Drop first 8 rows
for (i in 1:8) {
  df = df[-1,]
}

rownames(df) <- 1:nrow(df)

#Drop unnecessary features
df = subset(df, select = -c(status, brokered_by, bed, bath, acre_lot, house_size, prev_sold_date))
View(df)

#Detect missing values
sum(is.na(df))

#Eliminate missing values
df = na.omit(df)

#Save data
write_csv(df, "D://Download//Project 3 For Porfolio Data//pproject3_data.csv")


typeof(df['personal.income.annual.growth'])
