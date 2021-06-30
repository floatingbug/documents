import networkx as nx
import matplotlib.pyplot as plt

#Graph() gibt ein Objekt mit zwei Listen zurück: Eine mit Knoten und eine mit Kanten. 
#nodes() und edges() geben die Liste zurück.
graph = nx.Graph()
print(graph.nodes())
print(graph.edges())

#add_node() fügt dem Graph ein Knoten hinzu.
#add_nodes_from() fügt dem Graph eine Lise von Knoten hinzu.
graph.add_node('a')
graph.add_nodes_from(['b', 'c'])

#add_edge() fügt dem Graph eine Kante hinzu.
#mit add_edge(*tupel) fügt man ein tupel mit edges hinzu.
graph.add_edge(1,2)
edges = ('d', 'e')
graph.add_edge(*edges)

#Graph plotten
nx.draw(g)
plt.show()

#Adjazens-Matrix plotten
matrix = numpy.array()
graph = nx.from_numpy_array(matrix)
nx.draw(graph)
plt.show()


