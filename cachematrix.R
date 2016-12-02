## testmatrix: mat <- matrix(rnorm(25),nrow=5,ncol=5)



## create an object to hold a matrix, its inverse and varia set/get functions

makeCacheMatrix <- function(x = matrix()) {

## 1) initialize
	inv <- NULL
	## x is initialized in function call	

## 2) store
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
		
## 3) retrieve
	get <- function() x

## 4) store inverted matrix
	setinv <- function(y) inv <<- y

## 5) retrieve inverted matrix
	getinv <- function() inv

## 6 make functions available
list (set = set, get = get, setinv = setinv, getinv = getinv)
}


## take inverse of matrix, first check if available in cache, if not calculate

cacheSolve <- function(x,...) {

## get inverse from cache
	s <- x$getinv()

## check if inverse exist and if not calculate it
	if (!is.null(s)) {
	print("getting inverse from cache")
	return(s)
	}
	else { 
	print("calculating inverse")
		y <- x$get()
		s <- solve(y)
		x$setinv(s)
		s
	}
}








