algae <- read.table('C:\\Users\\jiang\\Desktop\\期末大作业\\数据分析与R软件\\Analysis.txt',
          header=F,  #表示要读的文件的第一行不包括变量名
          dec='.', #指出数值使用’.’字符分隔小数
          col.names=c('season','size','speed','mxPH','mnO2','Cl',
          'NO3','NH4','oPO4','PO4','Chla','a1','a2','a3','a4',
          'a5','a6','a7'), #给正在读取的变量一个名称向量
          na.strings=c('XXXXXXX')) #表示字符串被解释为未知值

head(algae) #显示数据框前六行

summary(algae) #给出数据的统计特性概览

library(DMwR) #加载函数库
data(algae) #重新读取数据
algae <- algae[-manyNAs(algae), ] #数据缺失率大于20%的样本剔除
clean.algae <- knnImputation(algae, k = 10) #进行数据填补

