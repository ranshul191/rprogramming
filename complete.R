complete <- function(directory, id = 1:332){
  
  list_nobs <- NULL
  # we create a vector to store individual data  as null to begin with
  #create an add_id function to add 0, 00 if required to file id
  add_id <- function(x){
    t=""
    if(x<10){
      t ="00"
      
    }else if (x>=10 & x<100){
      t="0"
    }
    return(t)
  }
  for(i in 1:length(id)){
    
    #we read data from different files
    pollution_data <-read.csv(file.path(directory, paste(add_id(id[i]),id[i], ".csv", sep="")))
    #return(pollution_data)
    clean_data <- pollution_data[complete.cases(pollution_data),]
    #return(clean_data)
    #list_id <- c(list_id, id[i])
    list_nobs<- c(list_nobs,  nrow(clean_data))
    
    #
    
    #head(pollution_data)
    
  }
  #list_nobs <- list_nobs[-1]
  df1<- data.frame(id = id, nobs =list_nobs)
  return(df1)
} 