import networkx as nx
from sage.schemes.affine.affine_rational_point import enum_affine_finite_field


#Initializing finite field on 47 elements
k=GF(2)

#Defining solution space to polynomial, enumerating points in space
A.<x0,x1,x2>=AffineSpace(3,k)
S=A.subscheme([(x0)^2+(x1)^2+(x2)^2-3*x0*x1*x2])
N=enum_affine_finite_field(S)

#Making the nodes of the graph
G=nx.MultiGraph()
G.add_nodes_from(N)

#Making edges from R1(x1,x2,x3)=(3*x2*x3-x1,x2,x3)
for points in N:
    
    
    #G.add_edge(points, R1*points, label='1')
    #G.add_edge((a,b,c), R2, label='2')
    #G.add_edge((a,b,c), R3, label='3')


#Making edges from R2(x1,x2,x3)=(x1,3*x1*x3-x2,x3)

#Making edges from R3(x1,x2,x3)=(x1,x2,3*x1*x2-x3)