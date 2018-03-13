## Rose's cachematrix function


## this function should return a matrix object with the functions, set, get, setinverse and getinverse. same 

makeCacheMatrix <- function(x = matrix()) {
      ivs <- NULL
      set <- function(y) {
            x <<- y
            ivs <<- NULL
      }
      get <- function() {x}
      setinverse <- function(inverse) {ivs <<- inverse}
      getinverse <- function() {ivs}
      list(set = set, get = get, setinverse = setinverse, 
           getinverse = getinverse)
}


## this function is of the same structure as the cachemean 

cacheSolve <- function(x, ...) {
      ivs <- x$getinverse()
      if(!is.null(ivs)){
            message("getting cached inverse")
            return(ivs)
      }
      data <- x$get()
      ivs <- solve(data, ...)
      x$setinverse(ivs)
      ivs
        ## Return a matrix that is the inverse of 'x'
}
