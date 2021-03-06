\name{IC}
\alias{IC}
\alias{AIC.gamlss}
\alias{GAIC}
\alias{extractAIC.gamlss}
\alias{GAIC.table}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Gives the GAIC for a GAMLSS Object}
\description{
 The function \code{IC()} calculates the Generalised Akaike information criterion (GAIC) for a given penalty \code{k} for a fitted GAMLSS object. 
 The function \code{AIC.gamlss()} is the method associated with a GAMLSS object of the generic function \code{AIC()}. 
 The function \code{GAIC()} is a synonymous of the function \code{AIC.gamlss}.
 The function \code{GAIC.table()} produces a table for different models and different penalties, \code{k}.
 
 The function \code{extractAIC} is a the method associated a GAMLSS object of the generic function \code{extractAIC} and it is 
 mainly used in the \code{stepAIC} function. 
The function \code{Rsq} compute a generalisation of the R-squared for not normal models.
}
\usage{
IC(object, k = 2)
\method{AIC}{gamlss}(object, ..., k = 2, c = FALSE)
GAIC(object, ..., k = 2, c = FALSE )
GAIC.table(object, ..., k = c(2, 3.84, round(log(length(object$y)), 2)))
\method{extractAIC}{gamlss}(fit, scale, k = 2, c = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{an gamlss fitted model}
  \item{fit}{an gamlss fitted model}
  \item{\dots}{allows several GAMLSS object to be compared using a GAIC}
  \item{k}{the penalty with default \code{k=2.5}}
  \item{c}{whether the corrected AIC, i.e. AICc, should be used, note that it applies only when  \code{k=2}}
  \item{scale}{this argument is not used in gamlss}
}

\value{
  The function \code{IC()} returns the GAIC for given penalty k of the GAMLSS object.
  The function \code{AIC()} returns a matrix contains the df's and the GAIC's for given penalty k. 
  The function \code{GAIC()} returns identical results to \code{AIC}. 
  The function \code{GAIC.table()} returns a table which its rows showing different models and its columns different \code{k}'s.  
  The function \code{extractAIC()} returns vector of length two with the degrees of freedom and the AIC criterion.  
}
\references{ 
Rigby, R. A. and  Stasinopoulos D. M. (2005). Generalized additive models for location, scale and shape,(with discussion), 
\emph{Appl. Statist.}, \bold{54}, part 3, pp 507-554.


Stasinopoulos D. M. Rigby R.A. (2007) Generalized additive models for location scale and shape (GAMLSS) in R.
\emph{Journal of Statistical Software}, Vol. \bold{23}, Issue 7, Dec 2007, \url{http://www.jstatsoft.org/v23/i07}.

Stasinopoulos D. M., Rigby R.A., Heller G., Voudouris V., and De Bastiani F., (2017) \emph{Flexible Regression and Smoothing: Using GAMLSS in R}, Chapman and Hall/CRC. 

(see also \url{http://www.gamlss.com/}).
}
\author{Mikis Stasinopoulos \email{d.stasinopoulos@londonmet.ac.uk} }

\seealso{ \code{\link{gamlss}} }
\examples{
data(abdom)
mod1<-gamlss(y~pb(x),sigma.fo=~pb(x),family=BCT, data=abdom)
IC(mod1)
mod2<-gamlss(y~pb(x),sigma.fo=~x,family=BCT, data=abdom)
AIC(mod1,mod2,k=3)
GAIC(mod1,mod2,k=3)
GAIC.table(mod1,mod2)
extractAIC(mod1,k=3)
rm(mod1,mod2)
}

\keyword{regression}% 
