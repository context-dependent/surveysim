#' simulate n responses to a single item multiple-choice questions
#' 
#' @param q a survey question of type mc_single
sim_mc_single <- function(q, n) {
    stopifnot(q$type == "mc_single")

    o <- q$response_options

    if(q$other) {
        o <- c(o, "Other")
    }

    d <- sample(forcats::fct_inorder(o), n, replace = TRUE) |>
        punch_holes(q$p_missing)

    d
}

#' simulate n responses to a 'number' type question
sim_number <- function(q, n, .f = cnorm) {
    stopifnot(q$type == "number")
    d <- .f(q, n) |>
        punch_holes(q$p_missing)

    d
}

#' default rng for sim_number
cnorm <- function(q, n) {
    lo <- as.numeric(q$min)
    hi <- as.numeric(q$max)
    extent <- hi - lo
    mu <- mean(c(hi, lo))
    sd <- extent / 6
    rnorm(n, mu, sd)
}

#' create holes in response data
punch_holes <- function(d, p) {
    r <- runif(length(d)) < p
    res <- d
    is.na(res) <- r
    res
}