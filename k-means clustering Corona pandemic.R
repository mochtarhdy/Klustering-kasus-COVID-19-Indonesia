#https://uc-r.github.io/kmeans_clustering

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

dfraw=read.delim("clipboard")
dfraw
#mengubah provinsi mjd rownames
df=dfraw[,c(2:4)]
rownames(df)=dfraw$Provinsi[1:34]
head(df)

#scaling/standardizing the data (biar robust sama outlier)
df <- scale(df)
head(df)

#K-means
k2 <- kmeans(df, centers = 3, nstart = 25)#centers=n cluster, nstart option that attempts multiple initial configurations and reports on the best one
k2

#visual it
fviz_cluster(k2, data = df)

#menurut gue paling pas pake 3 cluster
#but let see in statistical approach

#Elbow method
set.seed(123)

fviz_nbclust(df, kmeans, method = "wss") # ada di 3


#jadi yg paling tinggi/bagus ada di 2 cluster
#tapi mending pake 3 atau 4 agar bisa buat insight yang bagus


