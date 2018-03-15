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


## this function takes a makeCacheMatrix input, as in the object returned by makeCacheMatrix (a matrix, the functions get, set, setinverse, and getinverse), and retrieves the inverse if it was already stored in the cache. if it is a new matrix, it calculates the inverse, returns the inverse, and stores the inverse using the setinverse function

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
