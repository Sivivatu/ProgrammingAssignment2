## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The below function completes the following tasks:
# 1 sets a matrix to a vector
# 2 gets the matrix from the vector
# 3 sets the inverse of the matrix
# 4 gets the inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y    #superassigns m to the global environment
                m <<- NULL #superassigns m to the global environment
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
#the below function checks to see if inverse is cached in the global environment
#with the m variable. if it is (m =/= NULL) it returns m
#otherwise it calculates the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        message("calculating inverse")
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
