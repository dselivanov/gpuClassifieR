## * Linear classifier specification class

##' Linear Classifier specification constructor
##'
##' @param weights_init initial weights.
##' @return model.spec object
##' @author Mohamed Ishmael Diwan Belghazi
##' @export
##' @examples
##'
##' # generate initial weight matrix for a linear classifier with 10 classes
##' # and 784 features
##' w_init <- matrix(, 784, 10)
##' # Construct model
##' linear_classifier <- Classifier(weights_init=w_init)
Classifier <- function(weights_init=NULL) {

    if(is.null(weights_init))
        stop("initial weights specification is mandatory to set problem dimensions")

    n_classes <- NCOL(weights_init)
    n_feats <- NROW(weights_init)
    ## structure and return
    return(structure(
        list(
            weights=weights_init,
            n_classes=n_classes,
            n_feats=n_feats,
            cond_prob_fun=.get_condprob,
            cost_fun=.get_cost,
            grad_fun=.get_grad,
            final_grad=NULL,
            final_iter=NULL
        ),
        class=c("model.spec")
    ))
}
