import os

inputpath = "C:/Users/ttye7/Desktop/4th Year/FYP Auxiliary/transcripts/Transcripts"
outputpath = "C:/Users/ttye7/Desktop/4th Year/FYP Auxiliary/transcripts/Transcripts_Clean"
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
                # delete line 5 and 8. or pass any Nth line you want to remove
                # note list index starts from 0
                if number not in [0,1,2]:
                    fp.write(line)
            
            fp.close()

        
        
        
