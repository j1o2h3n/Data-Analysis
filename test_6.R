algae <- read.table('C:\\Users\\jiang\\Desktop\\期末大作业\\数据分析与R软件\\Analysis.txt',
          header=F,  #表示要读的文件的第一行不包括变量名
          dec='.', #指出数值使用’.’字符分隔小数
          col.names=c('season','size','speed','mxPH','mnO2','Cl',
          'NO3','NH4','oPO4','PO4','Chla','a1','a2','a3','a4',
          'a5','a6','a7'), #给正在读取的变量一个名称向量
          na.strings=c('XXXXXXX')) #表示字符串被解释为未知值
library(DMwR) #加载函数库
data(algae)
algae <- algae[-manyNAs(algae), ]
clean.algae <- knnImputation(algae, k = 10) #预处理

#系统聚类法
std <- scale(t(clean.algae[,4:11]), center=TRUE, scale=TRUE) #数据标准化
d0 <- dist(std, method="minkowski", diag=TRUE, upper=FALSE, p=1) #计算距离矩阵
hcs <- hclust(d0, method="complete") #系统聚类
plot(hcs, hang=-1) #画树形图
rect.hclust(hcs, k=3, h=NULL, border=2) #分类

#快速聚类法
std <- scale(t(clean.algae[,4:11]), center=TRUE, scale=TRUE) #数据标准化
kmeans(std, 3, iter.max=20, algorithm="Hartigan-Wong") #快速聚类
