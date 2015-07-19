source("cachematrix.R")

# create two different matrix
m3 <- matrix(rnorm(9), 3, 3)
m4 <- matrix(rnorm(16), 4, 4)

# create the wrapper around the first matrix
cm <- makeCacheMatrix(m3)
cm$get()

# get the inverse twice, making sure that the second call results in the value
# being retrieved from the cache
cacheSolve(cm)
cacheSolve(cm)

# change the matrix now
cm$set(m4)

# get the inverse again
# make sure the first time the inverse is not retrieved from the cache, since the
# value of the matrix was changed
cacheSolve(cm)
# get the inverse again, this time making sure it is retrieved from the cache
cacheSolve(cm)

