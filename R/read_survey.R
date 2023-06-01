#' Read a survey description yaml file
#' @param file path to the survey description file
#' @return a survey description object
read_survey <- function(file) {
    s <- yaml::read_yaml(file)
    if(is.null(s$survey)) {
        stop(glue::glue("{file} does not appear to be a survey."))
    }
    
    new_survey(
        s$survey$questions, 
        name = s$survey$name, 
        project = s$survey$project,
        respondent_id = s$survey$respondent_id
    )
}