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

fact <- factanal(clean.algae[,4:11], 4, scores="Bartlett", rotation="varimax") #进行因子分析
fact #显示因子分析结果
fact$scores #显示所有样本的因子得分
colMeans(clean.algae[,4:11]) #计算样本的各化学元素对应的均值