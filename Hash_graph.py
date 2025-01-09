import networkx as nx
from hash import r

def Markoff_graph(q):
    """Creates the Markoff graph for the prime power q using networkx Graph() function."""

    G=nx.Graph()

    n={(1,1,1)}
    m=set()

    new_edges=set()
    all_edges=set()

    while True:

        n_copy=n.copy()

        for g in n_copy:
            for a in range(3):
                p=r(a,g,q)
                t=(g,p)
                s=(p,g)
                m.add(p)
                if (t or s) not in all_edges:
                    new_edges.add(t), new_edges.add(s)
                    all_edges.add(t), all_edges.add(s)
                    
        if not new_edges:
            break

        else:
            G.add_edges_from(new_edges)
            n=m
            new_edges=set()

    return G