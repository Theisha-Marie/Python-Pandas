# Create vectors/factors for each column
sample_names <- paste("sample", 1:12, sep="")
sex <- c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F")
stage <- c("I", "II", "II", "I", "II", "II", "I", "II", "II", "I", "II", "II")
treatment <- rep(c("A", "B", "P"), each = 4)
myc <- c(2343, 457, 4593, 9035, 3450, 3524, 958, 1053, 8674, 3424, 463, 5105)

# Combine vectors into a dataframe
meta <- data.frame(sample_names, sex, stage, treatment, myc)

# Assign row names using rownames() function
rownames(meta) <- meta$sample_names

# Remove the sample_names column (optional)
meta$sample_names <- NULL

# Print the resulting metadata dataframe
print(meta)


# Install and load ggplot2 package (if not already installed)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)


# Create a scatter plot using ggplot2
ggplot(meta, aes(x = treatment, y = myc, color = stage)) +
  geom_point() +
  labs(title = "Scatter Plot of Treatment vs. Myc Levels",
       x = "Treatment", y = "Myc Levels",
       color = "Stage")



# Load the dplyr package
library(dplyr)


# Return only the treatment and sex columns using []
treatment_sex <- meta[, c("treatment", "sex")]

# Return the treatment values for samples 5, 7, 9, and 10 using []
treatment_samples <- meta[c(5, 7, 9, 10), "treatment"]

# Use subset() to return all data for those samples receiving treatment P
treatment_P <- subset(meta, treatment == "P")

# Use filter()/select() to return only the stage and treatment columns for those samples with myc > 5000
stage_treatment_myc_above_5000 <- meta %>%
  filter(myc > 5000) %>%
  select(stage, treatment)

# Remove the treatment column from the dataset using []
meta_no_treatment <- meta[, -which(names(meta) == "treatment")]

# Remove samples 7, 8, and 9 from the dataset using []
meta_removed_samples <- meta[-c(7, 8, 9), ]

# Keep only samples 1-6 using []
meta_samples_1_to_6 <- meta[1:6, ]

# Add a column called pre_treatment to the beginning of the dataframe with the values T, F, F, F, T, T, F, T, F, F, T, T
pre_treatment <- c("T", "F", "F", "F", "T", "T", "F", "T", "F", "F", "T", "T")
meta_with_pre_treatment <- cbind(pre_treatment, meta)

# Change the names of the columns to: "A", "B", "C", "D"
colnames(meta_with_pre_treatment) <- c("A", "B", "C", "D")

# Print the resulting dataframes
print(treatment_sex)
print(treatment_samples)
print(treatment_P)
print(stage_treatment_myc_above_5000)
print(meta_no_treatment)
print(meta_removed_samples)
print(meta_samples_1_to_6)
print(meta_with_pre_treatment)



