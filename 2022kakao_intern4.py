from collections import defaultdict
from typing import *
import heapq
import copy
'''
A - (a) - B
  \       |
   \      |
(c) \     |
     \    | (b)
      \   |
       \  |
        \ |
          C
Intensity between A <-> C can be simplified as min(c, max(a,b))

"simplify_graph_by_removing_shelters" will apply simplification decribed above 
 as long as shelters are empty
'''
def simplify_graph_by_removing_shelters(graph: Dict[int, Dict[int, int]], shelters: Set[int]):
    shelters_with_number_of_neighbors = []
    for shelter in shelters:
        shelters_with_number_of_neighbors.append((len(graph[shelter]), shelter))
    shelters_with_number_of_neighbors.sort()
    shelters_with_number_of_neighbors = shelters_with_number_of_neighbors[::-1]

    while shelters_with_number_of_neighbors:
        number_of_neibors, shelter = shelters_with_number_of_neighbors.pop()
        neighbors = list(graph[shelter].keys())
        for neighbor1_index in range(0, len(neighbors) - 1):
            for neighbor2_index in range(neighbor1_index + 1, len(neighbors)):
                neighbor1 = neighbors[neighbor1_index]
                neighbor2 = neighbors[neighbor2_index]
                if neighbor2 in graph[neighbor1]:
                    graph[neighbor1][neighbor2] = min(graph[neighbor1][neighbor2], max(graph[shelter][neighbor1], graph[shelter][neighbor2]))
                    graph[neighbor2][neighbor1] = graph[neighbor1][neighbor2]
                else:
                    graph[neighbor1][neighbor2] = max(graph[shelter][neighbor1], graph[shelter][neighbor2])
                    graph[neighbor2][neighbor1] = graph[neighbor1][neighbor2]
                if shelter in graph[neighbor1]:
                    del graph[neighbor1][shelter]
                if shelter in graph[neighbor2]:
                    del graph[neighbor2][shelter]
        del graph[shelter]

def find_intensity_to(gate, summit, graph, gates, summits):
    #(intensity, node)
    Q = [(0, gate)]
    visited = set()
    summits_exept_target_summit = summits - set([summit])
    #print(f"going from {gate} to {summit}")

    while Q:
        intensity, node = heapq.heappop(Q)
        #print(f"visiting {node}")
        visited.add(node)
        if node == summit:
            return intensity
        for to_ in graph[node].keys():
            if to_ not in visited and to_ not in summits_exept_target_summit and to_ not in gates:
                intensity_to = graph[node][to_]
                heapq.heappush(Q, (max(intensity, intensity_to), to_))
    return -1

def find_intensity_to2(gate, summit, graph):
    #(intensity, node)
    #print(graph)
    Q = [(0, gate)]
    visited = set()

    while Q:
        intensity, node = heapq.heappop(Q)
        #print(f"visiting {node}")
        visited.add(node)
        if node == summit:
            return intensity
        for to_ in graph[node].keys():
            if to_ not in visited:
                intensity_to = graph[node][to_]
                heapq.heappush(Q, (max(intensity, intensity_to), to_))
    return -1

def solution(n, paths, gates, summits):
    gates = set(gates)
    summits = set(summits)
#    print(f"gates : {gates}")
#    print(f"summits : {summits}")

    graph = defaultdict(dict)
    graph_without_gates_summits = defaultdict(dict)
    for from_, to_, time_to_move in paths:
        graph[from_][to_] = time_to_move
        graph[to_][from_] = time_to_move
        if from_ not in gates and to_ not in gates and from_ not in summits and to_ not in summits:
            graph_without_gates_summits[from_][to_] = time_to_move
            graph_without_gates_summits[to_][from_] = time_to_move

    #print(f"graph : {graph}")
    #print(f"graph_without_gates_summits : {graph_without_gates_summits}")
    shelters = set([i for i in range(1, n+1)]) - gates - summits

    intense_to_summits = []
    '''
    for gate in gates:
        for summit in summits:
            graph_to_summit = copy.copy(graph_without_gates_summits)
            graph_to_summit[gate] = graph[gate]
            for key in graph[summit].keys():
                graph_to_summit[key][summit] = graph[key][summit]
            v = find_intensity_to2(gate, summit, graph_to_summit)
            if v == -1:
                continue
            else:
                intense_to_summits.append((v, summit))
    '''

    simplify_graph_by_removing_shelters(graph, shelters)
    for gate in gates:
        for summit in summits:
            if summit in graph[gate]:
                intense_to_summits.append((graph[gate][summit], summit))
    intense_to_summits.sort()
    return (intense_to_summits[0][1], intense_to_summits[0][0])
