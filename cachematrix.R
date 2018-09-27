## Put comments here that give an overall description of what your
## functions do

## Create a matrix obj that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() {
    x
  }
  setinverse <- function(inv) {
    i <<- inv
  }
  getinverse <- function() {
    i
  }
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Solve for the cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("Getting cached inverse")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
