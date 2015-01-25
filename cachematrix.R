## R Programming, Assignment 2

## Purpose of this assigment:
##      Write a pair of functions that cache the inverse of a matrix

##      Note, I should also be checking to see if the original matrix has changed
##      Unfortunately, I found no stratightforward way of doing this
##      Sorry


## This function creates a "special" matrix object that can cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}


## This function computes the inverse of the special matrix returned by makeCacheMatrix
## If the inverse already exists, (and the matrix has not been changed), then this function 
## retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- inverse(data, ...)
    x$setinverese(i)
    i
}



