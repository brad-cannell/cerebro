# =============================================================================
# Create example data for the cerebro package
# 2019-04-21
# =============================================================================

library(dplyr)

# browseURL("https://en.wikipedia.org/wiki/List_of_X-Men_members")
# browseURL("http://www.factacular.com/subjects/Famous_Fictional_Addresses")

# library(tidyverse)

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
create_person <- function(id, nf, nl, by, bm, bd, an, as, gn, reps = 1) {
  out <- tibble::tibble(
    p_id           = rep(id, reps),
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

# Bind them all into a single data set
set.seed(123)
cerebro_data <- bind_rows(
  
  # Person with a single record in the data, but no typos or errors
  create_person(1, "Scott", "Summers", 1968, 04, 01, 430, "Main", "m", 1),
  
  # Person with multiple records in the data, but no typos or errors
  create_person(2, "Robert", "Drake", 1968, 07, 01, 1001, "Cemetery Ridge", "m", 2),
  
  # Person with multiple records in the data and misspelled first name
  create_person(3, "Warren", "Worthington", 1974, 10, 12, 2536, "Dominy", "m", 1),
  create_person(3, "Waren", "Worthington", 1974, 10, 12, 2536, "Dominy", "m", 1),
  
  # Person with multiple records in the data and misspelled first and last name
  create_person(4, "Sean", "Cassidy", 1970, 08, 03, 1504, "Rosedale", "m", 1),
  create_person(4, "Shawn", "Casidy", 1970, 08, 03, 1504, "Rosedale", "m", 1),
  
  # Person with multiple records in the data and middle name was incorrectly 
  # entered instead of first name
  create_person(5, "Jean", "Grey", 1965, 03, 12, 633, "Wedgewood", "f", 1),
  create_person(5, "Elaine", "Grey", 1965, 03, 12, 633, "Wedgewood", "f", 1),
  
  # First and last name switched
  create_person(6, "Kevin", "Sydney", 1967, 05, 18, 222, "Henderson", "m", 1),
  create_person(6, "Sydney", "Kevin", 1967, 05, 18, 222, "Henderson", "m", 1),
  
  # Person with multiple records in the data and Incorrect birth month
  create_person(7, "Lorna", "Dane", 1971, 05, 23, 1209, "Texas", "f", 1),
  create_person(7, "Lorna", "Dane", 1971, 06, 23, 1209, "Texas", "f", 1),
  
  # Person with multiple records in the data and Incorrect birth month and year
  create_person(8, "Calvin", "Rankin", 1960, 02, 02, 115, "Pennsylvania", "m", 1),
  create_person(8, "Calvin", "Rankin", 1970, 03, 02, 115, "Pennsylvania", "m", 1),
  
  # Similar name and dob to existing person that we want to classify as a non-match.
  create_person(9, "Scott", "Sumner", 1968, 04, 01, 1800, "Ocean", "m", 1),
  
  # Potential matches that only have the address in common. 
  # We want to filter out all of these rows to reduce the search space too.
  create_person(10, "Ryan", "Miller", 1975, 08, 08, 1610, "Shady Oaks", "m", 1),
  create_person(11, "Lucas", "Hillstrom", 1974, 02, 14, 1610, "Shady Oaks", "m", 1),
  create_person(12, "Gina", "Smith", 1957, 12, 30, 1610, "Shady Oaks", "f", 1),
  create_person(13,"Aleta", "Johnson", 1965, 07, 04, 1610, "Shady Oaks", "f", 1),
  
  # Husband and wife - should be non-match
  create_person(14, "Armando", "Muñoz", 1967, 09, 13, 419, "Bay", "m", 1),
  create_person(15, "Brittany", "Muñoz", 1969, 01, 16, 419, "Bay", "f", 1),
  
  # Missing address - no matches
  create_person(16, "Suzanne", "Chan", 1971, 02, 06, NA, NA, "f", 1),
  
  # Missing address - matches
  create_person(17, "Gabriel", "Summers", 1973, 11, 29, 817, "Parker", "m", 1),
  create_person(17, "Gabriel", "Summers", 1974, 11, 29, NA, NA, "m", 1),
  
  # Missing partial DOB - no matches
  create_person(18, "Kurt", "Wagner", 1963, 06, NA, 3434, "Orange", "m", 1),
  
  # Missing partial DOB - matches
  create_person(19, "Katherine", "Pryde", 1979, 04, 09, 1650, "8th", "f", 1),
  create_person(19, "Katherine", "Pryde", 1979, 04, NA, 1650, "8th", "f", 1),
  
  # Missing full DOB - no matches
  create_person(20, "Shiro", "Yoshida", NA, NA, NA, 711, "Willow", "m", 1),
  
  # Missing full DOB - matches
  create_person(21, "Ororo", "Munroe", 1966, 10, 25, 2222, "Lake", "f", 1),
  create_person(21, "Ororo", "Munroe", NA, NA, NA, 2222, "Lake", "f", 1),
  
  # Missing everything except name - no matches
  create_person(22, "Piotr", "Rasputin", NA, NA, NA, NA, NA, NA, 1),
  
  # Missing everything except name - matches
  create_person(23, "John", "Proudstar", 1964, 04, 19, 430, "University", "f", 1),
  create_person(23, "John", "Proudstar", NA, NA, NA, NA, NA, NA, 1),
  
  # Missing everything except address - non-match
  create_person(24, NA, NA, NA, NA, NA, 1610, "Shady Oaks", NA, 1),
  
  # Missing everything except DOB (same as Scott Summers, but not a match)
  create_person(25, NA, NA, 1968, 04, 01, NA, NA, NA, 1),
  
  # Throw in a few random no-matches
  create_person(26, "Jesse", "Bowen", 1971, 05, 04, 1222, "California", "f", 1),
  create_person(27, "Kim", "Collins", 1965, 06, 06, 918, "Shelby", "f", 1),
  create_person(28, "Russ", "Chalkers", 1967, 07, 08, 4710, "Peach", "m", 1),
  create_person(29, "Jacob", "Embers", 1969, 08, 10, 111, "Hill", "m", 1),
  create_person(30, "Rachel", "Jacobs", 1971, 09, 12, 2323, "Ash", "f", 1),
  create_person(31, "Gill", "Garcia", 1973, 10, 14, 12, "3rd", "m", 1)
)


# Add record number to the data
cerebro_data <- cerebro_data %>% 
  mutate(record_num = row_number()) %>% 
  select(p_id, record_num, everything())

# There are 31 unique people and 42 rows in the data