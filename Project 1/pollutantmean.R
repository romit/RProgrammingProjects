pollutantmean <- function(directory, pollutant, id = 1:332){
    
    # setwd("C:/Users/Mallika/Documents/Romit/R/Coursera R Programming/Projects/RProgrammingProjects/Project 1")
    
    df <- data.frame() # initialise a data frame
    dfsub <- data.frame()
    
    
    # Step 1: Convert the id into a char vector idchar, with element len=3
    #  
    idchar <- sprintf("%03d",id)
    
    
    
    # Step 2: Create a loop indexing over length of idchar
    # 
    # Step 3: Read  and rbind into df
    #
    # Step 4: At the end of the loop take the mean of df$pollutant
    
    
    
    
    
    
    for (i in 1:length(idchar)) {
        df <- rbind(df, read.csv(paste(paste(as.character(directory),idchar[i], sep="/"),".csv", sep="")))        
    }
    
    
mean(df[,eval(pollutant)], na.rm=TRUE)   
    
    
}