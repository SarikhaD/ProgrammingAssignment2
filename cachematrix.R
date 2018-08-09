## Put comments here that give an overall description of what your


## Taking a sample matrix for reference

a<-matrix(c(2,3,4,5,6,7,8,9,1),ncol=3)
## printing contents of the matrix to see what it looks like
a

## first function: to set and get the values in a matrix
makeCacheMatrix <- function(x = matrix()) {
  
  
  inv <- NULL
  
  ## the set() sets the value of the matrix to a variable x
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function() inv <<- solve(x)
  
  ## solve() is used to get the inverse of the matrix
  getInverse <- function() inv
  
  ## list is used to return a set of functions that this makecache function can do
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

#working:
# just showing what the functionality looks like
m<- makeCacheMatrix(a)
m$set(a)
m$get()
m$setInverse()
m$getInverse()
# As you can see, get Inverse shows the inverse of the matrix 'a' defined earlier

## second: this functions either returns the cached value of the inverse if available, or returns a calculated one

cacheSolve <- function(x) 
  {
  
  ## calls the other function that sets and gets the inverse
  n<-makeCacheMatrix(x)
  
  inv <- n$getInverse()
  if (!is.null(inv)) 
    
    # if inverse exists, prints it
    {
    message("getting cached data")
    return(inv)
  }
  
  # else, it calculates the entire thing and tehn returms it
  mat <- n$get()
  inv <- solve(mat)
  n$setInverse()
  inv
}

# just showing how it looks live
a
cacheSolve(a)
