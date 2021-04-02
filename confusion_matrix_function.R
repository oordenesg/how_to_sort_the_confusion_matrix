
library(lpSolve)

#The matrix.and.metrics function allows to sort the confusion matrix and get the external metrics.
# Parameters
# df: Data frame
matrix.and.metrics<-function(df){
  df2<-as.matrix(df)
  lp<-lp.assign(cost.mat = df2, direction = "max")$solution # Using the function lp.assign from lpSolve
  vector.solution<-as.vector(round(lp %*% seq_len(ncol(df2))))
  df2<-df2[,vector.solution]
  colnames(df2)<-vector.solution
  colnames(df2)<-rownames(df2)
  
  # Accuracy
  accuracy<-sum(diag(df2))/sum(df2)
  
  #Precision
  precision<- data.frame(precision=1:ncol(df2), sum_row=NA, pond=NA)
  for(i in 1:ncol(df2)){
    precision[i,1]<-df2[i,i]/sum(df2[,i])
    precision[i,2]<-sum(df2[i,])
    precision[i,3]<-(precision[i,1]*precision[i,2])/sum(df2)
  }
  precision<-sum(precision[,3])
  #Recall
  recall<- data.frame(recall=1:ncol(df2), sum_row=NA, pond=NA)
  for(i in 1:ncol(df2)){
    recall[i,1]<-df2[i,i]/sum(df2[i,])
    recall[i,2]<-sum(df2[i,])
    recall[i,3]<-(recall[i,1]*recall[i,2])/sum(df2)
  }
  recall<-sum(recall[,3])
  #F1
  f1<-2*((precision*recall)/(precision+recall))
  
  # Final output
  return(list(Cf.matrix = df2,Accuracy = accuracy, Precision = precision,Recall = recall, F1 = f1))
  
}

