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

lm.a1 <- lm(a1 ~ .,data=clean.algae[,4:12]) #建立多元线性回归模型
formula(lm.a1) #提取模型公式
summary(lm.a1) #提取模型资料，显示模型拟合结果
anova(lm.a1) #计算方差分析表
plot(lm.a1) #制作模型诊断图
