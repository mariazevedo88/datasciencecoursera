corr <- function(directory, threshold = 0) {
	
    ## 'directory' is character vetor of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between 
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!

    ## open the full name list in directory  
    files_full <- list.files(directory, full.names=TRUE)
    
    ## load the complete function in complete.R (before running
    ## this function execute the command source("complete.R" in
    ## R console
    complete_data <- complete(directory)
  
    ## calculates the number of observations required
    threshold_observations <- complete_data[complete_data$nobs > threshold,1]
    corr_data <- rep(NA,length(threshold_observations))
  
    for (i in threshold_observations) {
    	
      selected_data <- (read.csv(files_full[i]))
      complete_data <- complete.cases(selected_data)
      
      sulfate_data <- selected_data[complete_data, 2]
      nitrate_data <- selected_data[complete_data, 3]

	## calculates the correlation
      corr_data[i] <- cor(x = sulfate_data, y = nitrate_data)
    }
	
    corr_data <- corr_data[complete.cases(corr_data)]

}