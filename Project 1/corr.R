corr <- function(directory, threshold=0){
    
    # Initialist a data frame which will be in the FOR loop
    df <- data.frame()
    id <- 1:length(list.files(directory))
    
    
    for (i in id) {
        
        # Convert the numeric id into char filename with 3 characters along with ".csv"
        filename <- sprintf("%03d.csv",i)
        
        # Construct path string using directory and filename
        filepath <- paste(directory,filename,sep="/")
        
        # Read the file
        d <- read.csv(filepath) 
        
        # Use rbind to build up a dataframe of passed ids
        df <- rbind(df, c(i,nrow(d)))
    }
    
    # At the end of the loop, print out the dataframe
    names(df) <- c("id","nobs")

    dfsub <- subset(df, df$nobs > threshold)
    
    corr <- vector()
    
    
    for (i in dfsub$id){
        
        filename <- sprintf("%03d.csv", i)
        filepath <- paste(directory, filename, sep="/")
        
        ## Load the data
        d <- read.csv(filepath)
        
        dfcomplete <- d[complete.cases(d),]
        dcount <- nrow(dfcomplete)
        
        if(dcount >= threshold){
            corr <- c(corr,cor(dfcomplete$nitrate, dfcomplete$sulfate))
            
        }
        
    }
    corr <- corr[!is.na(corr)]
    corr
}