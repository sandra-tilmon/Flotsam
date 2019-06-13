# Eigen vector and eigen value code

library(matlib)   
### MATLIB
# https://cran.r-project.org/web/packages/matlib/vignettes/inv-ex1.html
# https://cran.r-project.org/web/packages/matlib/index.html
# install.packages("matlib")

### Matrix

# ENTER AS COLUMNS --or-- use option ", byrow=TRUE"
A <- as.matrix(data.frame(c(1,-2,-2),c(-1,3,1),c(1,0,2)))
A

tr(A) # trace

e <- eigen(A) # eigen everything
e$values

V <-e$vectors # save vectors as matrix
V

Avectors <- zapsmall(e$vectors) # reduce unreasonable numbers with zapsmall
Avectors
# for ease of copying
  # Avectors [,1]
  # Avectors [,2]
  # Avectors [,3]

det(V) # determinant

inv(V) # inverse

R(V) # rank



# Identity matrix 3*3
Id = as.matrix(data.frame(c(1,0,0),c(0,1,0),c(0,0,1)))
Id

gaussianElimination(A,Id,tol = sqrt(.Machine$double.eps),
                    verbose = TRUE, latex = FALSE, fractions = FALSE)


# D is a diagonal matrix with 1, 2, and 3 on its diagonal.
D <- as.matrix(data.frame(c(1, 0, 0),c(0, 2, 0),c(0,0,3)))
D

# Verify that A = VDV^-1
q8 <- zapsmall(V %*% D %*% solve(V))
q8
A
q8==A


# If B is an invertible matrix with eigenvector v-> corresponding to eigenvalue L, then
  # v0> is also an eigenvector for B^-1 but for eigenvalue 1/L

B = as.matrix(data.frame(c(2,0),c(0,-2)))
B

det(B)
eB <- eigen(B)
eB
eB$values
eB$vectors

Bi = inv(B)
eBi <- eigen(Bi)
eBi
eBi$values
eBi$vectors