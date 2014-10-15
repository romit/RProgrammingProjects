corr <- function(directory, threshold=0){
    
    # Run complete.R and get a dataframe of IDs and nobs
    df <- complete(directory,1:332)
    
    # Take subset of df with nobs are greater than threshold
    dfsub <- subset(df, nobs > threshold)
    
    # Initialise the vector to be constructed within the FOR loop
    corr <- vector()
    
    # Now the plan is to go over the files that have nobs greater than threshold
    for (i in dfsub$id){
        
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep="/")
        
        ## Load the data and omit NAs
        dfcomplete <- na.omit(read.csv(filepath))
        
        # Have already carried out the check by making a subset, not needed
        # dcount <- nrow(dfcomplete)        
        #if(dcount >= threshold){
            corr <- c(corr,cor(dfcomplete$nitrate, dfcomplete$sulfate))
            
        #}
        
    }
    corr
}