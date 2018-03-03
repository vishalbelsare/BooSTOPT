#' Estimate BooST
#'
#' Estimates Boosting of Smooth Trees (BooST)
#'
#'
#' @param x Design matrix with explanatory variables.
#' @param y Response variable.
#' @param p Proportion of variables tested in each node split (default 1).
#' @param d_max Number of nodes in each tree (default 4).
#' @param gamma aa
#'
#' @return An object with S3 class "Boost".
#' \item{Model}{A list with all trees.}
#' \item{fitted.values}{Final model fitted values.}
#' \item{nvar}{Number of variables in x.}
#' \item{varnames}{colnames of x to be used in other functions.}
#' \item{call}{The matched call.}
#' @keywords BooST, Boosting, Smooth Tree, Partial Effects
#' @export
#' @examples
#' ## == to be made == ##
#'
#' @references
#' blablabla
#'
# @seealso \code{\link{BooST}}, \code{\link{predict.SmoothTree}}, \code{\link{derivative_expression}}, \code{\link{estimate_derivative}}


smooth_tree=function(x, y, p = 1, d_max = 4, gamma = NULL){
  tree=grow_tree(x, y, p = p, d_max = d_max, gamma = gamma)
  fitted.values=eval_tree(x,tree[[1]],tree)
  result=list(Model=list(tree), fitted.values=fitted.values,nvar=ncol(x),varnames=colnames(x) ,call=match.call())
  class(result)="SmoothTree"
  return(result)
}