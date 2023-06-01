#' low level constructor for S3 survey objects
new_survey <- function(
    name = character(), 
    project = character(), 
    respondent_id = character(), 
    questions = list()
) {
    stopifnot(is.character(name))
    stopifnot(is.character(project))
    stopifnot(is.character(respondent_id))
    
    structure(
        questions,
        respondent_id = respondent_id,  
        name = name, 
        project = project, 
        class = "survey"
    )
}

#' produce true if x is a valid survey object
validate_survey <- function(x) {

}