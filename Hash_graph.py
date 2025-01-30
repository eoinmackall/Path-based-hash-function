import networkx as nx
from hash import r

def Markoff_graph(q):
    """Creates the Markoff graph for the prime power q using networkx Graph() function."""

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