# Load necessary libraries
library(admixtools)
library(tidyverse)



# Define the path for the directory you want to create
my_f2_dir = "C:/Users/Jonat/Desktop/QPADM/fstats/fdir"

# Create the directory if it doesn't exist
if (!dir.exists(my_f2_dir)) {
  dir.create(my_f2_dir, recursive = TRUE)
}

# Now you can proceed with the rest of your code

# Define paths
prefix = "C:/Users/Jonat/Desktop/QPADM/reich_data"
my_f2_dir = "C:/Users/Jonat/Desktop/QPADM/fstats"

target = c('Albanian.DG')
left= c('Croatia_LateC_EBA_Vucedol','Hungary_Avar_5_daughter.or.mother.AV1','Italy_IA_Republic_oEasternMediterranean.SG')


right = c('Mbuti.DG', 'Italy_North_Villabruna_HG', 'Han.DG', 'Papuan.DG', 'Karitiana.DG', 'Georgia_Satsurblia.SG', 'Iran_GanjDareh_N', 'Turkey_Epipaleolithic', 'Morocco_Iberomaurusian', 'Jordan_PPNB', 'Russia_HG_Karelia.SG', 'Russia_Samara_EBA_Yamnaya', 'Czech_Bohemia_CordedWare', 'Armenia_LBA.SG', 'ONG.SG')


mypops = c('Mbuti.DG', 'Italy_North_Villabruna_HG', 'Han.DG', 'Papuan.DG', 'Karitiana.DG', 'Georgia_Satsurblia.SG', 'Iran_GanjDareh_N', 'Turkey_Epipaleolithic', 'Morocco_Iberomaurusian', 'Jordan_PPNB', 'Russia_HG_Karelia.SG', 'Russia_Samara_EBA_Yamnaya', 'Czech_Bohemia_CordedWare', 'Armenia_LBA.SG', 'ONG.SG','S_Albanian-1.DG','Croatia_LateC_EBA_Vucedol','Hungary_Avar_5_daughter.or.mother.AV1','Italy_IA_Republic_oEasternMediterranean.SG')
extract_f2(prefix, my_f2_dir, pops = mypops, overwrite = TRUE, maxmiss = 1)
f2_blocks = f2_from_precomp(my_f2_dir, pops = mypops, afprod = TRUE)


results = qpadm(prefix, left, right, target, allsnps = TRUE)
results$weights
results$popdrop











# Load the .ind file
ind_file_path = "C:/Users/Jonat/Desktop/QPADM/reich_data.ind"
ind_data = read.table(ind_file_path, header = TRUE, sep = "\t")

# View unique IDs in the .ind file
unique_ids = unique(ind_data$ID)  # Replace 'ID' with the correct column name
cat("Available IDs:\n")
print(unique_ids)

# Check if your IDs are present
selected_ids = c("Mbuti.DG", "Italy_North_Villabruna_HG", "Papuan.DG")
missing_ids = setdiff(selected_ids, unique_ids)
if(length(missing_ids) > 0) {
  cat("Missing IDs:\n")
  print(missing_ids)
}







# Load the .ind file with tab separator and no header
ind_data = read.table(ind_file_path, header = FALSE, sep = "\t", stringsAsFactors = FALSE)

# Inspect the first few rows to understand the structure
head(ind_data)

# Assign column names manually if there are no headers
colnames(ind_data) = c("ID", "Population")  # Adjust based on your data

# Check column names
cat("Column names:\n")
print(names(ind_data))

# Extract unique IDs from the correct column
unique_ids = unique(ind_data$ID)
cat("Available IDs:\n")
print(unique_ids)

# Check for missing IDs
selected_ids = c("Mbuti.DG", "Italy_North_Villabruna_HG", "Papuan.DG")
missing_ids = setdiff(selected_ids, unique_ids)
if(length(missing_ids) > 0) {
  cat("Missing IDs:\n")
  print(missing_ids)
}




# Load the .ind file with space separator
ind_data = read.table(ind_file_path, header = FALSE, sep = " ", stringsAsFactors = FALSE, fill = TRUE)

# Inspect the first few rows to understand the structure
head(ind_data)






# Define individuals to include
selected_inds = c("Mbuti.DG", "Italy_North_Villabruna_HG", "Papuan.DG")  # Replace with actual individual IDs

# Extract f2-statistics for the specified individuals
f2_blocks = f2_from_geno(prefix, inds = selected_inds)

  
f2_blocks = f2_from_geno(prefix)
fit = qpgraph(f2_blocks, example_graph)

fit$score
#> [1] 19219.98


f2-statistics can also be used to estimate admixture weights:
  
  left = c("Altai_Neanderthal.DG", "Vindija.DG")
right = c("Chimp.REF", "Mbuti.DG", "Russia_Ust_Ishim.DG", "Switzerland_Bichon.SG")
target = "Denisova.DG"

qpadm(f2_blocks, left, right, target)$weights






