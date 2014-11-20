
## this is the function to set the matrix and get the matrix 
##returns a list of functions

makeCacheMatrix <- function(x = matrix()) {
  
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)

}


## a function which takes a matrix as an input and returns 
##the reverse of the matrix,only square matrix can be reveresed with solve

cacheSolve <- function(x, ...) {
        
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  ##inverse the matrx here 
  m<-solve(matrix, ...)
  ## call the setmatrix and return the matrix
  x$setmatrix(m)
  m
}

## using the functions
## test<-matrix(c(1,2,3,4),nrow=2, ncol=2)
##test
##test2<-makeCacheMatrix(test)
##cacheSolve(test2)
##cacheSolve(test2)
##test2$get()