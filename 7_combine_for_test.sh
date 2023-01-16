#!/bin/bash
# This file combines files for training(mailny used for scaling)
# WHEN WE PUT "*" IN "ls" COMMAND, IT RETURNS FULL PATHNAME ALSO.
# SO WE DON'T NEED TO RUN "FOR" LOOP TO ADD PATH NAME
path=$(pwd)

# Create Output Directory to save combined root files
output_path="${path}/cs/test/prescale_combine"
if [ -d "$output_path" ]
then
    echo "$output_path already exists."
else 
    $(mkdir -p ${output_path})
    echo "$output_path has been created"
fi

#combining for different folder
declare -a options=("charged" "uubar" "ddbar" "ssbar" "ccbar") #"mixed" 

for opt in "${options[@]}"
do
    input_path="$path/cs/test/$opt"
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

    # # Storing file Upto given number
    # echo "Combining $length_input_file_array files from $input_path"
    # path_in_string=""  # Empty string
    # for((i=0; i<$length_input_file_array; i++))
    # do
    #     path_in_string+=" $input_path/${input_file_array[i]}"
    # done

    # Combining files
    output_file="$output_path/test_$opt.root"
    if [ -f "$output_file" ]
    then
        echo "$output_file already exists."
        $(rm -f ${output_file})
        echo "So $output_file has been deleted. Plese run this bash file again."
    else 
        echo "Please wait for Combinded output file from $input_path folder....."
        # echo "$(hadd ${output_path}/train_$opt.root ${path_in_string})" 
        # WHEN WE PUT "*" IN "ls" COMMAND, IT RETURNS FULL PATHNAME ALSO.
        echo "$(hadd ${output_file} ${input_files})" 
                                        # the 2nd arfument of "hadd" should be "STRING" only
    fi

done