import os

lines = []
filename = ""





os.chdir(inputpath)

#open transcripts directory
for file in os.listdir():

    if file.endswith(".txt"):

        filename = file
        
        # read file
        with open(inputpath + "/" + filename, 'r') as fp:
            # read an store all lines into list
            lines = fp.readlines()
            fp.close()
        
        # write file
        with open(outputpath + "/" + filename, 'w') as fp:
            # iterate each line
            for number, line in enumerate(lines):
                # delete lines 1, 2, 3
                if number not in [0,1,2]:
                    fp.write(line)
            
            fp.close()