
# INTRO TO R!
# http://geostat2010.info

# See also: 
# 1. Quick-R [http://www.statmethods.net];
# 2. R by example [http://www.mayin.org/ajayshah/KB/R/index.html];
# 3. Addicted to R [http://addictedtor.free.fr/graphiques]

# R: session management
# Your R objects are stored in a workspace
# To list the objects in your workspace:  
ls()

# To remove ALL objects in your workspace:
rm(list=ls()) # or use Remove all objects in the Misc menu

# To save your workspace to a file, you may type  
save.image() # or use Save Workspace. in the File menu

# Assignment "<-" used to indicate assignment
x <- c(1,2,3,4,5,6,7)
x <- c(1:7)
x <- 1:7
# note: as of version 1.4 "=" is also a valid assignment operator

# R as a calculator:
5 + (6 + 7) * pi^2
log(exp(1))
log(1000, 10)
sin(pi/3)^2 + cos(pi/3)^2
Sin(pi/3)^2 + cos(pi/3)^2
#	R is case sensitive! 
# Error: couldn't find function "Sin"

log2(32)
sqrt(2)
seq(0, 5, length=6)
# plots in R:
plot(sin(seq(0, 2*pi, length=100)))

# Basic (atomic) data types
# Logical
x <- T; y <- F
x; y
# Numerical
a <- 5; b <- sqrt(2)
a; b
# Character
a <- "1"; b <- 1
a; b
a <- "character"
b <- "a"; c <- a
a; b; c

# Vectors, Matrices, Arrays
# Vector: Ordered collection of data of the same data type
x <- c(5.2, 1.7, 6.3) 
log(x) 
y <- 1:5
z <- seq(1, 1.4, by = 0.1)
y + z
length(y)
mean(y + z)
# Matrix: Rectangular table of data of the same type
m <- matrix(1:12, 4, byrow = T); m 
y <- -1:2
m.new <- m + y
t(m.new)
dim(m)
dim(t(m.new))

# R is designed to handle statistical data and therefore predestined to deal with missing values / Numbers that are "not available"
x <- c(1, 2, 3, NA)
x + 3
# "Not a number"
log(c(0, 1, 2))
0/0

# Subsetting
# It is often necessary to extract a subset of a vector or matrix
# R offers a couple of neat ways to do that
x <- c("a", "b", "c", "d", "e", "f", "g", "h")
x[1]
x[3:5]
x[-(3:5)]
x[c(T, F, T, F, T, F, T, F)]
x[x <= "d"]
m[,2]
m[3,]

# Lists are very flexible
# Lists: Session
Empl <- list(employee="Anna", spouse="Fred", children=3, child.ages=c(4,7,9))
str(Empl)
Empl[[4]]
Empl$child.a
Empl[4]   # a sublist consisting of the 4th component of Empl
names(Empl) <- letters[1:4]
Empl <- c(Empl, service=8)
unlist(Empl)  # converts it to a vector. Mixed types will be converted to character, giving a character vector.

# with matrices
x.mat <- matrix(c(3, -1, 2, 2, 0, 3), ncol = 2)
x.mat	   
dimnames(x.mat) <- list(c("L1","L2","L3"), c("R1","R2"))
x.mat

# subsetting
cw <- chickwts
# where does this object "chickwts" came from?
str(cw)
cw[3,2]
# Labels in data frames
labels(cw)

# Control structures and functions
# Grouped expressions in R
x = 1:9
if (length(x) <= 10) 
{
   x <- c(x,10:20);
	 print(x) 
} else 
{
	print(x[1])
}

# Loops in R
for(i in 1:10) {
    x[i] <- rnorm(1)
}
x

j = 1
while(j < 10) {
  print(j)
  j <- j + 2 
}

# Functions:
add = function(a,b) 
{ result = a+b
  return(result) }
add(2,5)

# General Form of Functions
# function(arguments) {
#       expression
#     }

larger <- function(x,y) {
  if(any(x < 0)) return(NA)
  y.is.bigger <- y > x
  x[y.is.bigger] <- y[y.is.bigger]
  x
}
larger(2,5)

# GETTING HELP:
# If you are in doubt...
help(predict)
# 'predict' is a generic function for predictions from the results
#  of various model fitting functions. 
help(predict.lm)
#  'predict.lm' produces predicted values, obtained by evaluating the regression function in the frame 'newdata' 
data(cars)
str(cars)
predict(lm(dist~speed, cars), cars)

# see also:
system("open http://cran.r-project.org/doc/contrib/Short-refcard.pdf")

# Calling Conventions for Functions
# Arguments may be specified in the same order in which they occur in function definition, in which case the values are supplied in order.
# Arguments may be specified as name=value, when the order in which the arguments appear is irrelevant. 
# Above two rules can be mixed.

x1 <- rnorm(100)
y1 <- rnorm(100)
t.test(x1, y1, var.equal=F, conf.level=.99)
t.test(var.equal=F, conf.level=.99, x1, y1)

# Plots
x <- 1:10
y <- 2*x + rnorm(10,0,1)
plot(x,y,type="p") # Try l,b,s,o,h,n
  # axes=T, F
  #  xlab="age", ylab="weight"
  # sub="sub title", main="main title"
  # xlim=c(0,12), ylim=c(-1,12)

# Interactive Graphics Functions
locator(x, type="p") 
# Waits for the user to select locations on the current plot using the left mouse button. This continues until n (default 500) points have been selected.

identify(x, y, labels) 
# Allow the user to highlight any of the points defined by x and y. 

text(x,y,"Hey")
# Write text at coordinate x,y.

# Plots for Multivariate Data
pairs(stack.x)
x <- 1:20/20
y <- 1:20/20
z <- outer(x,y,function(a,b){cos(10*a*b)/(1+a*b^2)})
contour(x,y,z)
persp(x,y,z)
image(x,y,z)

# Histogram:
par(mfrow=c(1,2))   # set up multiple plots
simdata <- rchisq(100,8)
hist(simdata)  # default number of bins
hist(simdata, breaks=2)  # etc,4,20

# Scatterplot
z1 <- rnorm(50)
z2 <- rnorm(50)
rho <- .75         # (or any number between -1 and 1)
x2 <- rho*z1+sqrt(1-rho^2)*z2
plot(z1,x2)

# working with spatial data:
library(sp); library(rgdal); library(RSAGA)
data(meuse)
str(meuse)
coords <- SpatialPoints(meuse[, c("x", "y")])
summary(coords)

# We can add the tabular data to make a SpatialPointsDataFrame object:
meuse1 <- SpatialPointsDataFrame(coords, meuse)
str(meuse1, max.level=2)

# plot this data:
plot(as(meuse1, "Spatial"), axes = TRUE)
plot(meuse1, add = TRUE)
plot(meuse1[meuse1$ffreq == 1, ], col = "green", add = TRUE)

# We can create spatial objects from scratch! For example a DEM:
dem <- expand.grid(x=seq(100,600,100), y=seq(100,600,100), KEEP.OUT.ATTRS=FALSE)
dem$Z <- as.vector(c(23, 24, 34, 38, 45, 51, 24, 20, 20, 28, 18, 49, 22, 20, 19, 14, 38, 45, 19, 15 ,13, 21, 23, 25, 14, 11, 18, 11, 18, 19, 10, 16, 23, 16, 9, 6))
str(dem)
# 3D Real-Time Visualization Device System for R:
library(rgl)
rgl.open()
terrain3d(x=seq(100,600,100), y=seq(100,600,100), z=dem$Z*5, back="lines")
# convert to a sp object:
gridded(dem) <- ~x+y
dem <- as(dem, "SpatialGridDataFrame")
str(dem)
spplot(dem[1],  main="DEM", scales = list(draw = FALSE), col.regions=topo.colors(25))
# export to GIS format:
writeGDAL(dem, "dem6.sdat", "SAGA")

# Controlling SAGA from R:
library(RSAGA)
rsaga.env()
# get modules:
rsaga.get.modules("ta_channels")
# get parameters:
rsaga.get.usage("ta_channels", module=5)
rsaga.geoprocessor(lib="ta_channels", module=5, param=list(DEM="dem6.sgrd", DIRECTION="channels.sgrd", CONNECTION="route.sgrd", NETWORK="channels.shp")) 
# import the derived streams:
dem$route <- readGDAL("route.sdat")$band1
channels <- readOGR("channels.shp", "channels")
spplot(dem[2],col.regions=rev(gray(0:20/20)), main="Flow connectivity", sp.layout=list("sp.lines",channels,col="red"))

# Controlling FWTools from R:
gdalwarp <- gsub("/", "\\\\", dir(path="C:/PROGRA~1/FWTOOL~1.7", pattern="gdalwarp.exe", recursive=TRUE, full.names=TRUE))
gdalwarp

# downloading data from web:
MOD12Q1 <- "ftp://anonymous:test@e4ftl01u.ecs.nasa.gov/MOLT/MOD12Q1.004/2004.01.01/"
# download wget:
download.file("http://users.ugent.be/~bpuype/cgi-bin/fetch.pl?dl=wget/wget.exe", destfile=paste(R.home(), "bin", "wget.exe", sep="\\"))
download.file(paste(MOD12Q1, "MOD12Q1.A2004001.h18v03.004.2006117173748.hdf", sep=""), destfile=paste(getwd(), "MOD12Q1.A2004001.h18v03.004.2006117173748.hdf", sep="/"), mode='wb', method='wget') 
# define the local coordinate system:
NL.prj <- "+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +no_defs +towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812"
system(paste(gdalwarp, " HDF4_EOS:EOS_GRID:\"", workd, "\\MOD12Q1.A2004001.h18v03.004.2006117173748.hdf\":MOD12Q1:Land_Cover_Type_1 -t_srs \"", NL.prj, "\" IGBP2004NL.tif -r near -te 0 300000 280000 625000 -tr 500 500", sep=""))

# end of script;