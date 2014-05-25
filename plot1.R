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
## Question 1                                                                      ##
##################################################################################### 

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

data1999 <- summaryPM[summaryPM$year==1999,]
dim(data1999)
s1 <- sum(data1999$Emissions)

data2002 <- summaryPM[summaryPM$year==2002,]
dim(data2002)
s2 <- sum(data2002$Emissions)

data2005 <- summaryPM[summaryPM$year==2005,]
dim(data2005)
s3 <- sum(data2005$Emissions)

data2008 <- summaryPM[summaryPM$year==2008,]
dim(data2008)
s4 <- sum(data2008$Emissions)

## We can see from this simple plot that the total emissions have decreased over the years.
plot(c(1999,2002,2005,2008),c(s1,s2,s3,s4),col="red",pch=16,main="Total Emissions",xlab="Year",ylab="Total Emissions")
dev.copy(png, file = "plot1.png")
dev.off()

