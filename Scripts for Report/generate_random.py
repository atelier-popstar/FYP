import os
import random

#change active directory to use os.listdir()
os.chdir(inputpath)

#iterate through all dialogues in input folder
for transcript_no, file in enumerate(os.listdir()):
    filename = file
    input_file_path = inputpath + "/" + filename
    for x in range(10):        
        output_file_path = outputpath + "/Randomization " + 
        str((x + 1)) + "/" + filename
        
        lines = open(input_file_path).readlines()
        random.shuffle(lines)
        open(output_file_path, 'w').writelines(lines)
