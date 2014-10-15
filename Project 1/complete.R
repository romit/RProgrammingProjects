complete <- function(directory, id = 1:332){
    
    # Initialist a data frame which will be in the FOR loop
    df <- data.frame()

    for (i in id) {
        
        # Convert the numeric id into char filename with 3 characters along with ".csv"
        filename <- sprintf("%03d.csv",i)
        
        # Construct path string using directory and filename
        filepath <- paste(directory,filename,sep="/")
        
        # Read the file
        # Remove rows with any NAs by na.omit (read only complete cases)
        d <- na.omit(read.csv(filepath)) 
        
        # Use rbind to build up a dataframe of passed ids
        df <- rbind(df, c(i,nrow(d)))
    }
    
    # At the end of the loop, print out the dataframe
    names(df) <- c("id","nobs")
    df 
    
    
}