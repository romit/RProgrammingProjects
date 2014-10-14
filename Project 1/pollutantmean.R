pollutantmean <- function(directory, pollutant, id = 1:332){
    
    # Initialist a data frame which will be in the FOR loop
    df <- data.frame()

    
    
    for (i in id) {
        
        # Convert the numeric id into char filename with 3 characters along with ".csv"
        filename <- sprintf("%03d.csv",i)
        
        # Construct path string using directory and filename
        filepath <- paste(directory,filename,sep="/")
        
        # Use rbind to build up a dataframe of passed ids
        df <- rbind(df, read.csv(filepath))        
    }

    # At the end of the loop, determine the mean of column "pollutant", ignoring NAs
    mean(df[,pollutant], na.rm=TRUE)   
    
    
}