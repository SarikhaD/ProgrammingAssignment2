## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

a<-matrix(c(2,3,4,5,6,7,8,9,1),ncol=3)
a
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

#working:
m<- makeCacheMatrix(a)
m$set(a)
m$get()
m$setInverse()
m$getInverse()
# As you can see, get Inverse shows the inverse of the matrix 'a' defined earlier

## second:

cacheSolve <- function(x) 
  {
  n<-makeCacheMatrix(x)
  inv <- n$getInverse()
  if (!is.null(inv)) 
    {
    message("getting cached data")
    return(inv)
  }
  mat <- n$get()
  inv <- solve(mat)
  n$setInverse()
  inv
}
a
cacheSolve(a)
