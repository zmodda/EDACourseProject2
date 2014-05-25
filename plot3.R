#####################################################################################
## Assignment                                                                      ##
##################################################################################### 
## The overall goal of this assignment is to explore the National Emissions Inventory 
## database and see what it say about fine particulate matter pollution in the United 
## states over the 10-year period 1999–2008. You may use any R package you want to 
## support your analysis.
## You must address questions and tasks in your exploratory analysis. 
## For each question/task you will need to make a single plot. Unless specified, 
## you can use any plotting system in R to make your plot.

## You can download the needed data from here:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set the directory where the household power consumption data is. 
setwd("C:\\Users\\adriana dominguez\\Documents\\CourseraDataScience\\EDA")

#### Get the datasets needed from the folder where you downloaded everything.
SourceClassCode <- readRDS(".\\Source_Classification_Code.rds")
summarySCCPM25 <-  readRDS(".\\summarySCC_PM25.rds")

## I create new datasets just in case of mistakes.
sourceClass <- SourceClassCode
summaryPM <- summarySCCPM25

#####################################################################################
## Question 3                                                                      ##
#####################################################################################
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the 
## ggplot2 plotting system to make a plot answer this question.

## baltimoreData will contain the Baltimore city data we're interested in.
baltimoreData <- summaryPM[summaryPM$fips=="24510",]
library(plyr)
library(ggplot2)

qplot(year, Emissions, data=baltimoreData, stat="summary", fun.y="sum",facets= .~type,main="Total Emissions per Source",ylab="Total Emissions",xlab="Year")
## We can see in the graph that there was a general decrease for the sources
## Non-Road, Non-Point and On-Road, while there was a slight increase up to 2006
## for Point source.
dev.copy(png, file = "plot3.png")
dev.off()

