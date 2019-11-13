bagraf <- function(x,y,col=NA)
{
   x <- as.numeric(x);y=as.numeric(y)
   means <- rowMeans(cbind(x,y))
   differences <- x-y
   
   isInf <- union(which(means==-Inf),which(differences==-Inf))
   if(length(isInf>0))
   {
   means <- means[-isInf];differences<-differences[-isInf]
   }
   
   prumer <- mean(na.omit(differences))
   dev <- sd(na.omit(differences))
   
   
   if(is.na(col)){
   plot(means,differences,xlab="Průměr",ylab='Rozdíl',ylim=c(prumer-4*dev,prumer+4*dev))
   }
   else{
      plot(means,differences,xlab="Průměr",ylab='Rozdíl',col=as.character(col))
      }

   abline(h=prumer)
   abline(h=(prumer-3*dev),lty=2)
   abline(h=(prumer+3*dev),lty=2)
   abline(h=(prumer-1.96*dev),lty=3,col='red')
   abline(h=(prumer+1.96*dev),lty=3,col='red')
   
   text(y=(3.3*dev+prumer),x=mean(na.omit(means)),labels='+ 3 sd')
   text(y=(prumer-3.2*dev),x=mean(na.omit(means)),labels='- 3 sd')
   
   
   
   return(matrix(cbind(means,differences),ncol=2))
}