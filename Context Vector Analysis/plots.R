library(ggcorrplot)
DATA_MPNET<- read.csv("Tukey Results v2/DATA_DIAL_MPNet.csv",header=TRUE)
#plot(x = DATA_MPNET$OS, 
#     y = DATA_MPNET$Devscore,
#     xlab = "Deviation Score",
#     ylab = "Null Hypothesis Rejections for OS",
#     main = "Other-Similarity vs. Deviation Score"
#     )
#summary(DATA_MPNET)
DATA_MPNET$EyeCon <- as.integer(as.logical(DATA_MPNET$EyeCon))
DATA_MPNET$Familiar <- as.integer(as.logical(DATA_MPNET$Familiar))
cordata = DATA_MPNET[,c(1,2,3,4,5,6,7,8,9,10)]
corr <- round(cor(cordata, method="spearman"), 1)
corr
#cor.test(DATA_MPNET$OS, DATA_MPNET$Familiar)

#OSgbar <- subset(DATA_MPNET$OSg, DATA_MPNET$OS > 0)
#OSfbar <- subset(DATA_MPNET$OSf, DATA_MPNET$OS > 0)
#boxplot(OSgbar, OSfbar, main = "Average OSg and OSf given OS", xlab = "Null Hypothesis Rejections", horizontal = TRUE)
#OS_DATA <- DATA_MPNET[-c(1:4, 6, 8, 10)]
#SS_DATA <- DATA_MPNET[-c(1:4, 5, 7, 9)]
#plot(x = DATA_MPNET$OS,
     #y = DATA_MPNET$OSf,
     #xlab = "Rejections for OS",
     #ylab = "Rejections for OSf",
     #main = "Association of OS and OSf Rejections")
#SSfamTRUE<- subset(DATA_MPNET$SS, DATA_MPNET$Familiar == "true")
#SSfamFALSE<- subset(DATA_MPNET$SS, DATA_MPNET$Familiar == "false")
#SSecTRUE<- subset(DATA_MPNET$SS, DATA_MPNET$EyeCon == "true")
#SSecFALSE<- subset(DATA_MPNET$SS, DATA_MPNET$EyeCon == "false")
#(SSfamFALSE, SSfamTRUE, SSecTRUE, SSecFALSE, main = "SS Rejections vs Familiarity and Eye Contact", at = c(1,2,4,5), names = c("Familiar", "Unfamiliar", "EyeCon", "No Eye Contact"), col = c("darkorchid3", "darkorchid4", "darkorchid3", "darkorchid4"), horizontal = TRUE, notch = FALSE)
plot(x = DATA_MPNET$OS,
y = DATA_MPNET$DevScore,
xlab = "Null Hypothesis Rejections for OS",
ylab = "Deviation Score",
main = "Association of OS and Deviation Score")
