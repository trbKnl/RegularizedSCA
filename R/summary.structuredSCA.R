#'Display a summary of the results of \code{cv_structuredSCA()}.
#'
#'@param object Object of class inheriting from 'structuredSCA'.
#'@param disp The default is \code{simple}; in this case, the recommended tuning 
#'            parameter values for Lasso will be displayed. 
#'            If \code{full}, then information is displayed regarding 1) the 
#'            recommended tuning parameter values for Lasso, 2) the proper region 
#'            for Lasso tuning parameter values, based on the 1SE rule, 3) Predicted 
#'            residual sum of squares (PRESS), 4) Lasso tuning 
#'            parameter values that have been evaluated.
#'@param ...  Argument to be passed to or from other methods. 
#'@examples
#'\dontrun{
#'## S3 method for class 'structuredSCA'
#'summary(object, disp="full")
#'}
#'
#'@export
summary.structuredSCA <- function(object, disp, ...){
  
  PRESS <- object$PRESS
  LassoSequence <- object$LassoSequence
  LassoRegion <- object$LassoRegion
  RecommendedLasso <- object$RecommendedLasso 
  
  if(missing(disp)){
    disp <- "simple"
  }
  
  if(disp == "simple"){
    
    cat(sprintf("\nRecommended tuning parameter value for Lasso:\n"))
    print(RecommendedLasso)
    
  }else if(disp == "full"){
    
    cat(sprintf("\nRecommended tuning parameter value for Lasso:\n"))
    print(RecommendedLasso)
    
    cat(sprintf("\nA region for suitable Lasso tuning parameter values based on 1SE rule:\n"))
    print(LassoRegion)
    
    
    cat(sprintf("\nPredicted residual sum of squares (PRESS):\n"))
    print(PRESS)
    
    
    cat(sprintf("\nLasso tuning parameter values that have been evaluated:\n"))
    print(LassoSequence)
    
    
  }else{
    stop("either simple or full")
  }
}