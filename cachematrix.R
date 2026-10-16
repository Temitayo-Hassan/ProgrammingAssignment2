##The makeCacheMatrix() function creates a special matrix that stores a matrix and its inverse. This function allows
##the inverse to be reused without calculating it each time.


makeCacheMatrix <- function(x = matrix()) {
m <- NULL
get <- function() x
set <- function(y) {
x <<- y
m <<- NULL
}
getinverse <- function() m
setinverse <- function(inverse)
m <<- inverse
list(
set = set,
get = get,
setinverse = setinverse,
getinverse = getinverse)


}


## cacheSolve calculates the matrix inverse if it has not been cached, and returns the cached inverse when available

cacheSolve <- function(x, ...) {
m <- x$getinverse()
if (!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m

        ## Return a matrix that is the inverse of 'x'
}
