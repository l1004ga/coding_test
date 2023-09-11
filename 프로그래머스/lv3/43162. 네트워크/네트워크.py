from collections import deque

def bfs(node, computers, visited):
    network_queue = deque()
    network_queue.append(node)
    
    while network_queue:
        source = network_queue.popleft()
        visited.add(source)
        
        for (destination, state) in enumerate(computers[source]):
            
            if destination == source:
                continue
            
            if destination not in visited:
                if state == 1:
                    network_queue.append(destination)
        
        

def solution(n, computers):
    visited = set()
    count_line = 0
    
    for node in range(0, n):
        if node not in visited:
            bfs(node, computers, visited)
            count_line += 1
    
    return count_line