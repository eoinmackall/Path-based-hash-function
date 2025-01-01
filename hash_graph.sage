import matplotlib.pyplot as plt
import networkx as nx
from sage.schemes.affine.affine_rational_point import enum_affine_finite_field

def Markoff_graph(q=11):
    """Creates the graph of Markoff triples for the prime power q 
    using networkx MultiGraph() function. Defaults to (the small value) 
    q=11, since enumeration through q^3 possible solutions to the Markoff equation
    is required."""
    #Initializing finite field on prime number of elements
    k=GF(q)

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
    for points in N:

        if not G.has_edge(points, R0(points), key='0'):
            G.add_edge(points, R0(points), key='0')

        if not G.has_edge(points, R1(points), key='1'):
            G.add_edge(points, R1(points), key='1')
    
        if not G.has_edge(points, R2(points), key='2'):
            G.add_edge(points, R2(points), key='2')