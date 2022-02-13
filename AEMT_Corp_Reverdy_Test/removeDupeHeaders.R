
mergedAEMT<- read.csv("mergedAEMT.csv",header=TRUE,sep="\t",fileEncoding="UTF-16LE")
mergedAEMT<- mergedAEMT[!grepl("Speaker",mergedAEMT$Speaker),]

connection <- file("C:/Users/tanya/OneDrive/Documents/Tom's Stuff/FYP/AEMT_Corp_Reverdy_Test/AEMTDialFULLCLEAN",open="at")
write.table(mergedAEMT, connection, sep="\t")
close(connection)

