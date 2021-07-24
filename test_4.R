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

std.x <- scale(clean.algae[4:11]) #数据标准化
prin1 <- princomp(std.x,cor=TRUE) #从相关阵R出发做主成分分析
summary(prin1) #列出主成分分析主要结果
loadings(prin1) #各主成分对应的系数，即相关矩阵R的单位正交化的特征向量
screeplot(prin1,type="lines") #画出主成分的碎石图
biplot(prin1) #画数据关于前两个主成分的散点图和原坐标在主成分下的方向

pre <- predict(prin1) #预测各个样本的主成分值
cor(std.x)
y <- eigen(cor(std.x)) #求cor(std.x)的特征值和特征向量
y1 <- y$values[1] #第一个特征值赋给y1
y2 <- y$values[2]
y3 <- y$values[3]
y4 <- y$values[4]
y5 <- y$values[5]
y6 <- y$values[6]
scores <- (y1*pre[,1]+y2*pre[,2]+y3*pre[,3]+y4*pre[,4]+y5*pre[,5]+y6*pre[,6])/
          (y1+y2+y3+y4+y5+y6)
#计算每个样本的综合得分
scores #显示得分情况
