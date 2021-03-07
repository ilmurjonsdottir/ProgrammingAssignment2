## How to Cache a Matrix Inversion in R

## Purpose of cache-ing the results is to easily look them up later


## Making the object
## The object is creating the ´Matrix´ which can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        
}


## This function will compute what is returned by the makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## My attempt 
## First thing is to create the matrix
## parent function
## level 1
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        ## function inside the parent function, child function
        set <- function(y){
                ## double arrow used because we are not in the parent function
                ## level 2
                x <<- y
                inv <<- NULL 
        }
        get <- function()x
        ## another child function
        setInverse <- function(inverse) inv <<- inverse
        ## another child function
        getInverse <- function() inv 
        ## another child function
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Now we are solving, computing the inverse of the matrix I just created

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat,...)
        x$setInverse(inv)
        inv
}


## I tried it slightly differently
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function() inv <<- solve(x) 
        getInverse <- function() inv
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

