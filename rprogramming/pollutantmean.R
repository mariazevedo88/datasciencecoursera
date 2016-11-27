pollutantmean <- function (directory, pollutant, id = 1:332){
      ## 'directory' is character vetor of length 1 indicating
	## the location of the CSV files

	## 'pollutant' is a character vector of length 1 indicating
	## the name of the pollutant for which we will calculate the
	## mean; either "sulfate" or "nitrate".

	## 'id' i an integer vector indicating the monitor ID numbers
	## to be used

	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	## NOTE: Do not round the result!

	## open the full name list in directory   
	files_full <- list.files(directory, full.names=TRUE)    

	#create empty data frame
	pollutant_data <-data.frame()
    	
	#appending values to data frame
	for (i in id) {
         pollutant_data <- rbind(pollutant_data, read.csv(files_full[i]))
    	}
     
      #calculating the mean of the subset pollutant column without counting NA lines
    	mean(pollutant_data[,pollutant], na.rm = TRUE)
}