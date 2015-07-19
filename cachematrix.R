## The below pair of functions provide a way to store and retrieve a matrix and its inverse
## without having to recalculate the inverse every time it is requested (as long as the original
## matrix itself is not changed).

## makeCacheMatrix creates a wrapper function around the matrix() implementation (similar to a class object in OO)
## that provides a getter and setter as well as functions to store and retrive the inverse of
## the original matrix
makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
   set <- function(y) {
      x <<- y
      inv <<- NULL
   }
   get <- function() x
   setinv <- function(inverse) inv <<- inverse
   getinv <- function() inv
   list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}


## cacheSolve takes a "cache matrix object" and returns the inverse of the stored matrix
## if the inverse has already been calculated, then the cached version is returned
## if the inverse has not yet been calculated, then cacheSolve will first create the inverse
## and then set the result onto the cache-matrix object
cacheSolve <- function(x, ...) {
   ## Return a matrix that is the inverse of 'x'
   inv <- x$getinv()
   if(!is.null(inv)) {
      message("getting cached inverse matrix")
      return(inv)
   }
   matrix <- x$get()
   inv <- solve(matrix)
   x$setinv(inv)
   inv
}
