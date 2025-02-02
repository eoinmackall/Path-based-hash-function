import networkx as nx

def r(i,T,q):
    """Calculates involution changing ith index (mod 3)
    on Markoff triple T=(x,y,z) mod q"""
    
    (x,y,z)=(T[0],T[1],T[2])

    w0 = (3*y*z - x) % q
    w1 = (3*x*z-y) % q
    w2 = (3*x*y-z) % q
    
    if i % 3 == 0:
        return (w0,y,z)
    if i % 3 == 1:
        return (x,w1,z)
    if i % 3 == 2:
        return (x,y,w2)

def Markoff_graph(q):
    """Creates the Markoff graph for the prime 
    power q using networkx Graph() function."""

    G = nx.Graph()
    visited = set()
    stack = [(1, 1, 1)]

    while stack:
        node = stack.pop()
        for i in range(3):
            neighbor = r(i, node, q)
            if neighbor not in visited:
                G.add_edge(node, neighbor)
                stack.append(neighbor)
        visited.add(node)
    return G

def Markoff_multigraph(q):
    """Creates the Markoff multigraph for the prime 
    power q using networkx MultiGraph() function."""

    G = nx.MultiGraph()
    visited = set()
    stack = [(1, 1, 1)]

    while stack:
        node = stack.pop()
        for i in range(3):
            neighbor = r(i, node, q)
            if neighbor not in visited:
                if neighbor !=node:
                    G.add_edge(node, neighbor)
                    G.add_edge(neighbor,node)
                    stack.append(neighbor)
                else:
                    G.add_edge(node,neighbor)
        visited.add(node)
    return G

def has_self_loop(G: nx.Graph, node):
    try:
        if G[node][node] != None:
            return True
    except Exception:
        return False