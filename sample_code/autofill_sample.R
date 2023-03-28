## Example code for AutoFill function in gslab_r/GSLabMisc package

# to install gslab_r/GSLabMisc to access AutoFill, uncomment the lines below:
# install.packages("devtools")
# library(devtools)
# install_github("gslab-econ/gslab_r/GSLabMisc")

# load gslab_r/GSLabMisc package
library(GSLabMisc)

# set directory and output name
dir_path <- "~/Desktop"
output_path <- "scalars.tex"

# clean output file if it already exists
if (output_path %in% list.files(dir_path)) {
  unlink(file.path(dir_path, output_path))
}

# prepare inputs for AutoFill
# -- use big.mark = "," in formatC  for the thousand comma
# -- use digits = X and format = "f" in formatC to output X decimal digits 
scalars <- list(
  "Effect"   = formatC(1234.567, digits = 2, big.mark = ",", format = "f"), # result: "1,234.57"
  "StdError" = formatC(350.031,  digits = 2, big.mark = ",", format = "f"), # result: "350.03"
  "RSquared" = formatC(0.87,     digits = 3, format = "f")  # result: "0.870"
)

scalar_names <- names(scalars)
scalar_values <- unlist(scalars) 

# create scalars_example.tex file
mapply(
  GSLabMisc::AutoFill, commandname = scalar_names, content = scalar_values, 
  outfile = file.path(dir_path, output_path), mode = "text", appendmode = TRUE
)

