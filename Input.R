crx<-read.csv("data.csv",header=TRUE,sep=";")
head(crx,6)
str(crx)
 crx$G3<-as.factor(crx$G3)
 crx <- crx[ sample( nrow( crx ) ), ]
X <- crx[,1:15]
y <- crx[,16]
trainX <- X[1:320,]
trainy <- y[1:320]
testX <- X[321:329,]
testy <- y[321:329]
model <- C50::C5.0( trainX, trainy )
summary( model )
model <-  C50::C5.0( trainX, trainy, trials=10 )
p <- predict( model, testX, type="class" )
sum( p == testy ) / length( p )