pollutantmean <- function(directory, pollutant, id=1:332){
  pollution_data =NULL
  # define the pollution data as null to begin with
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
  #for loop to create file ids and read from the files
  for(i in 1:length(id)){
    
    #we bind and merge the data from different files
    pollution_data <-rbind(pollution_data,read.csv(file.path(directory, paste(add_id(id[i]),id[i], ".csv", sep=""))))
    #
    
    #head(pollution_data)
    
  }  
  
  return(mean(pollution_data[,pollutant], na.rm = TRUE))
}