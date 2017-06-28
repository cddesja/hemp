#' Item-Person Map for the Rasch Model and Its Variants
#'
#' Draws an item-person map for the Rasch Model and its variants using item difficulty parameters and latent trait estimates.
#' @param x Item difficulty paramaters for the items
#' @param y Latent trait (ability) estimates for persons
#' @param k Number of classes when grouping items and persons
#' @param n Number of persons represented by each X in the item-person map
#' @param ... Additional elements to pass to the plot function
#' @examples
#' ## Item-person map for an exam with 15 items and 500 examinees
#' set.seed(355)
#' difficulty <- rnorm(15)
#' names(difficulty) <- 1:15
#' ability <- rnorm(500)
#' itemperson.map(difficulty,ability,main="Item-Person Map", n=20)
#'
#' @export

itemperson.map <- function(x, y, k=8, n=10, ...) {
  #Function to find mid positions
  get.mid.interval <- function(x) {
    out <- NULL
    for (i in 1:length(x)) {
      comma.pos <- regexpr(",",as.character(x[i]))
      end <- regexpr("]",as.character(x[i]))
      xmin <- as.numeric(substr(as.character(x[i]),2,comma.pos[1]-1))
      xmax <- as.numeric(substr(as.character(x[i]),comma.pos[1]+1,end[1]-1))
      out <- append(out,(xmin+xmax)/2)
    }
    return(out)
  }
  #Function to draw item-person map
  dx <- .1
  op <- par(mar=c(1,1,3,1),lab=c(1,1,2))
  plot(c(-.5,.5),c(-5,5),type="n",xlab="",ylab="",axes=FALSE, ...)
  axis(4,at=-5:5,labels=FALSE,pos=0)
  axis(4,at=-4.5:4.5,labels=FALSE,tcl=-.25,pos=0)
  text(rep(-dx/3,11),-5:5,-5:5,srt=90,cex=.8)
  text(c(-.25,.25),c(5,5),c("Person","Item"),font=2)
  text(c(-.25,.25),c(4,4),c(paste("(N=",length(y),")",sep=""),paste("(k=",length(x),")",sep="")))
  abline(v=c(-dx,dx),col="lightgrey")
  h.y <- hist(y,breaks=k,plot=FALSE)
  x.breaks <- h.y$breaks
  if (min(x) < h.y$breaks[1]) x.breaks <- c(min(x),x.breaks)
  if (max(x) > h.y$breaks[length(h.y$breaks)]) x.breaks <- c(x.breaks,max(x))	
  h.x <- hist(x,breaks=x.breaks,plot=FALSE)
  x.idx <- cut(x,breaks=x.breaks)
  y.idx <- cut(y,breaks=h.y$breaks)
  x.tab <- table(get.mid.interval(x.idx))
  y.tab <- ceiling(table(get.mid.interval(y.idx))/n)
  dz <- max(h.y$density)/max(y.tab)
  j <- 0
  for (i in 1:length(y.tab)) {        
    if (y.tab[i]>1) {
      xx <- -dx+seq(0,-h.y$density[i],by=-dz)
      yy <- rep(as.numeric(names(y.tab[i])),y.tab[i])
      text(xx[-length(xx)],yy,"x",cex=.8,pos=2)
    }
    else
      text(-dx,as.numeric(names(y.tab[i])),"x",cex=.8,pos=2)		  
  }
  j <- 0
  for (i in 1:length(table(x.idx))) { 
    if (table(x.idx)[i]!=0) {
      j <- j+1
      if (x.tab[j]>1) {
        xx <- dx+seq(0,x.tab[j]*.5/10,by=.5/10)
        yy <- rep(as.numeric(names(x.tab[j])),x.tab[j])
        text(xx[-length(xx)],yy,names(x[which(as.numeric(x.idx)==i)]),cex=.8,pos=4)
      }
      else
        text(dx,as.numeric(names(x.tab[j])),names(x[which(as.numeric(x.idx)==i)]),cex=.8,pos=4)			
    }
  }
}

