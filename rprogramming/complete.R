complete <- function (directory, id = 1:332){

    ## 'directory' is character vetor of length 1 indicating
    ## the location of the CSV files

    ## 'id' i an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return a data frame of the form:
    ## id nobs 
    ## 1  117
    ## 2  1041
    ## ... 
    ## where 'id' is the monitor ID number and 'nobs' is the 
    ## number of complete cases


    ##open full name list of files in directory
    files_full <- list.files(directory, full.names=TRUE) 
    
    ##create empty data frames 
    complete_data<-data.frame()
    sample<-data.frame()
    nobs<-data.frame()    
    
    for (i in id) {
    	sample <-(read.csv(files_full[i],header=TRUE))
   	nobs <- sum(complete.cases(sample))
    	complete_data<- rbind(complete_data, data.frame(i,nobs))
    }

    complete_data
}
