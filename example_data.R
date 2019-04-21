# =============================================================================
# Create example data for the cerebro package
# 2019-04-21
# =============================================================================

browseURL("https://en.wikipedia.org/wiki/List_of_X-Men_members")
browseURL("http://www.factacular.com/subjects/Famous_Fictional_Addresses")

library(magrittr)

# Random date generator
# rdob <- function() {
#   sample(
#     seq(
#       as.Date('1960/01/01'), 
#       as.Date('1980/01/01'), 
#       by="day"
#     ), 1
#   )
# }

# Simplify creating people
create_person <- function(nf, nl, by, bm, bd, an, as, gn, reps = 1) {
  out <- tibble::tibble(
    name_first     = rep(nf, reps),
    name_last      = rep(nl, reps),
    birth_year     = rep(by, reps),
    birth_month    = rep(bm, reps),
    birth_day      = rep(bd, reps),
    address_num    = rep(an, reps),
    address_street = rep(as, reps),
    gender         = rep(gn, reps),
    exposure       = sample(0:1, reps, replace = TRUE),
    outcome        = sample(0:1, reps, replace = TRUE)
  )
  out
}

# Person with a single record in the data, but no typos or errors
ss <- create_person("Scott", "Summers", 1968, 4, 1, 420, "Main St.", "m", 1)

# Person with multiple records in the data, but no typos or errors
rd <- create_person("Robert", "Drake", 1968, 7, 1, 1001, "Cemetery Ridge", "m", 3)

# Person with multiple records in the data and misspelled first name


# Person with multiple records in the data and misspelled first and last name


# Person with multiple records in the data and middle name was incorrectly 
# entered instead of first name


# First and last name switched


# Person with multiple records in the data and Incorrect birth month


# Person with multiple records in the data and Incorrect birth month and year


# Similar to existing person that we want to classify as a non-match.


# Potential matches that only have the address in common. We want to filter out all of these rows to reduce the search space too.


# Husband and wife - should be non-match


# Missing address


# Missing partial DOB


# Missing full DOB


# Missing everything except name


# Missing everything except address - non-match


# Missing everything except DOB


# Throw in a few random no-matches


# Bind them all into a single data set
cerebro_data <- bind_rows(
  no_errors,
  
)