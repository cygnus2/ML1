# Read training set
using DataFrames
raw = readtable("../train.csv");
println(size(raw));
# select and store the headers
head = names(raw);

# Want to do a linear regression model using first three features
# remove entries which have NA, otherwise it causes problems

n = names(raw); 
println(n[1:5]);
# remove NA entries in the features "full_sq", "life_sq" and "floor"
raw = raw[find(!isna(raw[:,n[3]])),:];
println("After weeding out NA from column 3, ", size(raw));
raw = raw[find(!isna(raw[:,n[4]])),:]; 
println("After weeding out NA from column 4, ", size(raw));
raw = raw[find(!isna(raw[:,n[5]])),:]; 
println("After weeding out NA from column 5, ", size(raw));

## Another way maybe to use the function
## y = DataFrames.na_omit(x)[1]

# select X
ntrain = size(raw,1);
nfeat  = size(raw,2);
x = raw[: , collect(3:5)];
y = raw[: , nfeat]; 

# perform feature normalization

