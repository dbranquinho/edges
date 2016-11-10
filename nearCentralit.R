library(GGally)
library(network)
library(sna)
library(ggplot2)

myData <- as.matrix(read.table("D:/Data Science/Semantix/edges.dat", quote="\"", 
                    comment.char="", stringsAsFactors=FALSE))
net = rgraph(myData, mode = "graph")
net = network(net, directed = FALSE)
network.vertex.names(net) = 1:dim(myData)[1]
par(new=F)
ggnet2(net,color = "blue", label = TRUE, label.color = "white")

degree(net,cmode="indegree")
degree(net,cmode="outdegree")

degree(net)
centralization(net,degree,cmode="indegree")
