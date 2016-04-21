#platinum genome matrix
library(gplots)
platinum_genome_matrix=read.table("/home/jesper/bioinformatik/SVDB/matrix2_cnvnator.csv",quote="",sep=",")
x  <- as.matrix(platinum_genome_matrix)
heatmap.2(x,col=heat.colors(25),scale="col" ,main = "Inheritance of structural variants",dendrogram="row",trace="none",key=FALSE,margins = c(8, 16))
legend(x="top", y="top",
            c("The CEPH/Utah pedigree 1426"),box.lwd=0)

#create the db size vs frequency of unqiue hits p
library(ggplot2)
db_size=read.csv("/home/jesper/bioinformatik/SVDB/findsv/hist_5_10_20.csv",quote="",sep=",")
x=c(db_size[,1])
y=c(db_size[,2])
sd=c(db_size[,3])
plot()
qplot(x,y)+geom_errorbar(aes(x=x, ymin=y-sd, ymax=y+sd), width=0.25)+geom_line(size=0.5)+ggtitle("The fraction of unique hits in databases of different sizes")+xlab("Samples in the DB")+ylab("fraction of unique hits")

sample_db=read.csv("/home/jesper/bioinformatik/SVDB/findsv/SVDB_hist_3.csv",quote="",sep=",")
s=c(sample_db[,2])
barplot(s,beside=TRUE,space=c(0,0,0),names.arg=c(1,2,3),main="Distribution of the number of hits per variant",xlab="DB size = 3")

sample_db=read.csv("/home/jesper/bioinformatik/SVDB/findsv/SVDB_hist_150.csv",quote="",sep=",")
f=c(sample_db[,2])
name=c(1:150)
barplot(f,beside=TRUE,space=0,names.arg=name,main="Distribution of the number of hits per variant",xlab="DB size = 150")