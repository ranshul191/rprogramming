corr <- function(directory, threshold = 0){
  list_corr<- NULL
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
  df <-complete(directory)
  df_thresh <- df[df$nobs>threshold,]
  if(nrow(df_thresh)==0){
    return(list_corr)
  }else{
  rownames(df_thresh) <- 1:nrow(df_thresh)
  for(i in 1:nrow(df_thresh)){
    
    #we read data from different files
    pollution_data <-read.csv(file.path(directory, paste(add_id(df_thresh[i, "id"]),df_thresh[i, "id"], ".csv", sep="")))
    #return(pollution_data)
    clean_data <- pollution_data[complete.cases(pollution_data),]
    #return(clean_data)
    #list_id <- c(list_id, id[i])
    list_corr<- c(list_corr,  cor(clean_data$nitrate, clean_data$sulfate))
    
    #
    
    #head(pollution_data)
    
  }
  return(list_corr)
  }
}
  