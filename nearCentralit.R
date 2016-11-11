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
palette <- c("purple","blue","green","yellow","orange","red")

c.d   <- degree(net)
col<- as.integer(5*(c.d-min(c.d))/diff(range(c.d))+1)

g<-ggnet2(net, label = TRUE, label.color = "white",color = palette[col])

plot(g,vertex.color=palette[col],main="Degree Centrality",
     layout=layout.fruchterman.reingold)

degree(net,cmode="indegree")
degree(net,cmode="outdegree")

degree(net)
centralization(net,degree,cmode="indegree")
