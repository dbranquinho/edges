library(GGally)
library(network)
library(sna)
library(ggplot2)

myData <- as.matrix(read.table("D:/Data Science/Semantix/edges.dat", quote="\"", 
                               comment.char="", stringsAsFactors=FALSE))
set.seed(3)
net = rgraph(myData, mode = "graph")
net = network(net, directed = TRUE)
network.vertex.names(net) = 1:dim(myData)[1]
par(new=F)
palette <- c("black","purple","blue","green","orange","red")

c.d   <- degree(net)
col<- as.integer(5*(c.d-min(c.d))/diff(range(c.d))+1)

g<-ggnet2(net, label = TRUE, label.color = "white",color = palette[col])

plot(g,vertex.color=palette[col],main="Degree Centrality",
     layout=layout.fruchterman.reingold)

degree(net,cmode="indegree")
degree(net,cmode="outdegree")

degree(net)
degree(net,cmode="indegree")
degree(net,cmode="outdegree")


print(degree(net))
print(gden(net,mode="graph"))
print(centralization(net,degree,cmode="indegree"))

gden(net,mode="graph")

connectedness(net)

betweenness(net)

geo=geodist(net)

geo$gdist

newEgo <- ego.extract(net,10)
newEgo

closeness(newEgo)


geo=geodist(net)
geo$gdist

centralization(net,degree,mode="graph")
centralization(net,betweenness,mode="graph")
centralization(net,closeness,mode="graph")


