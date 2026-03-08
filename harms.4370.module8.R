install.packages("plyr")
library(plyr)
students <- read.table(file.choose(),
                       header = TRUE,
                       sep = ",",
                       stringsAsFactors = FALSE)
str(students)
head(students)
students_gendered_mean <- ddply(students,
                                .(Sex),
                                summarise,
                                Grade_Mean = mean(Grade, na.rm = TRUE),
                                N = length(Grade))
students_gendered_mean
write.table(students_gendered_mean,
            file = "Students_Gendered_Mean.txt",
            row.names = FALSE,
            sep = "\t",
            quote = FALSE)

students <- as.data.frame(students)
i_students <- subset(students, grepl("i", Name, ignore.case = TRUE))
i_students
write.csv(data.frame(Name = i_students$Name),
          file = "Names_with_i.csv",
          row.names = FALSE)

write.csv(i_students,
          file = "Students_filtered_i.csv",
          row.names = FALSE)
