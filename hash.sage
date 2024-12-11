import matplotlib.pyplot as plt
import networkx as nx
from sage.schemes.affine.affine_rational_point import enum_affine_finite_field


#Initializing finite field on prime number of elements
k=GF(5)

#Defining S as solution space to polynomial
A.<x0,x1,x2>=AffineSpace(3,k)
S=A.subscheme([(x0)^2+(x1)^2+(x2)^2-3*x0*x1*x2])
H=S.Hom(S) #defining H as endomorphisms of S; for edge creation

R0=H([3*x1*x2-x0,x1,x2])
R1=H([x0,3*x0*x2-x1,x2])
R2=H([x0,x1,3*x0*x1-x2])

#Making the graph
N=enum_affine_finite_field(S)
del N[0] #removing disjoint (0,0,0) point

G=nx.MultiGraph()
G.add_nodes_from(N)

for points in N:

    if not G.has_edge(points, R0(points), key='0'):
        G.add_edge(points, R0(points), key='0')

    if not G.has_edge(points, R1(points), key='1'):
        G.add_edge(points, R1(points), key='1')
    
    if not G.has_edge(points, R2(points), key='2'):
        G.add_edge(points, R2(points), key='2')


#Saves a .png file displaying G to local drive
plt.figure(figsize=(12, 8), dpi=300)
plt.axis('off')
nx.draw(G, 
        with_labels=True, 
        node_color='skyblue', 
        node_size=20, 
        node_shape='o', 
        alpha=1, 
        linewidths=2, 
        font_size=12, 
        font_color='black', 
        edge_color='gray', 
        width=2, 
        style='solid', 
        pos=nx.spring_layout(G))
plt.savefig('my_plot.png')
