from copy import deepcopy

def make_graph(wires):
    graph = {}
    for (src, dest) in wires:
        if src not in graph:
            graph[src] = {}
        graph[src][dest] = True
        
        if dest not in graph:
            graph[dest] = {}
        graph[dest][src] = True
    return graph

def split_graph(graph, src, dest):
    del graph[src][dest]
    del graph[dest][src]
    
def bfs(graph, start):
    
    queue = [start]
    visited = set(queue)
    count = 1
    
    while queue:
        src = queue.pop(0)
        for dest in graph[src].keys():
            if dest not in visited:
                visited.add(dest)
                queue.append(dest)
                count += 1
    return count

def solution(n, wires):
    my_graph = make_graph(wires)
    
    min_value = 100
    
    for wire in wires:
        new_graph = deepcopy(my_graph)
        split_graph(new_graph, wire[0], wire[1])
        min_value = min(min_value, abs(bfs(new_graph, wire[0]) - bfs(new_graph, wire[1])))
    
    return min_value