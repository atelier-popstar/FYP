lines = []
# read file
with open(r"C:/Users/ttye7/Desktop/4th Year/FYP Auxiliary/transcripts/Transcripts/q1ec1.txt", 'r') as fp:
    # read an store all lines into list
    lines = fp.readlines()

# Write file
with open(r"C:/Users/ttye7/Desktop/4th Year/FYP Auxiliary/transcripts/Transcripts_Clean/q1ec1.txt", 'w') as fp:
    # iterate each line
    for number, line in enumerate(lines):
        # delete line 5 and 8. or pass any Nth line you want to remove
        # note list index starts from 0
        if number not in [0,1,2]:
            fp.write(line)