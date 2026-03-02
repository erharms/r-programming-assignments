s3.1 <- list(name = "Eddie", age = 21, GPA = 3.5) 
s3.2 <- list(name = "Lewai", age = 19, GPA = 3.8) 
setClass("Person",
         slots = list(
           name = "character",
           age = "numeric",
           gpa = "numeric"
         ),
         prototype = list( # Optional: sets default values
           name = "",
           age = NA_real_,
           gpa = NA_real_
         )
)
eddie <- new("Person", name = "Eddie", age = 21, gpa = 3.5)
lewai <- new("Person", name = "Eddie", age = 19, gpa = 3.8)
