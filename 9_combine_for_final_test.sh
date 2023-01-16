#!/bin/bash
# This file combines files for testing
# WHEN WE PUT "*" IN "ls" COMMAND, IT RETURNS FULL PATHNAME ALSO.
# SO WE DON'T NEED TO RUN "FOR" LOOP TO ADD PATH NAME
path=$(pwd)

# Output-Input Directory to save combined root files
input_path="$path/cs/test/signal_scaled"
output_path=$input_path

# Reading input files
input_files=$(ls ${input_path}/*.root)
input_file_count=$(ls ${input_path}/*.root | wc -l)
echo "Number of input files in $input_path is $input_file_count"

# WHEN WE PUT "*" IN "ls" COMMAND, IT RETURNS FULL PATHNAME ALSO.
# SO WE DON'T NEED TO RUN "FOR" LOOP TO ADD PATH NAME

# #Storing filename in array from long single string
# declare -a input_file_array=() #If we don't write "()" here array won't be empty in every step
# let count=0
# for l in ${input_files}
# do
#     input_file_array[$count]="$l"
#     ((count++))
# done
# length_input_file_array=${#input_file_array[@]}

# #checking whether array dimension is ok
# if [ $input_file_count -eq $count ]
# then
#     if [ $input_file_count -eq $length_input_file_array ]
#     then
#         echo "Input file count and input file array dimension are same."
#     else
#         echo "There is some discrepancy between Input file count and input file array dimension"
#         echo "Because Input file count is $input_file_count but array dimension is $length_input_file_array"
#     fi
# fi

# # Storing files in one string
# input_files_string=""  # Empty string
# for((i=0; i<$length_input_file_array; i++))
# do
#     input_files_string+=" $input_path/${input_file_array[i]}"
# done


# Combinig files
output_file="$output_path/test.root"
if [ -f "$output_file" ]
then
    echo "$output_file already exists."
    $(rm -f ${output_file})
    echo "So $output_file has been deleted. Plese run this bash file again."
else 
    echo "Please wait for Combinded output file from $input_path folder....."
    # echo "$(hadd ${output_path}/test.root ${path_in_string})" 
    # WHEN WE PUT "*" IN "ls" COMMAND, IT RETURNS FULL PATHNAME ALSO.
    echo "$(hadd ${output_file} ${input_files})" 
                                    # the 2nd arfument of "hadd" should be "STRING" only
fi