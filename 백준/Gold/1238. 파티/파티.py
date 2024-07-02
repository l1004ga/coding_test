import heapq, sys
from collections import defaultdict
town_count, road_count, party_town = map(int, sys.stdin.readline().split())

city = defaultdict(dict)
for _ in range(road_count):
     start, end, value = map(int, sys.stdin.readline().split())
     city[start][end] = value

def dijkstra(start, end):
    visited = []
    min_value_store = [sys.maxsize] * town_count #각 노드별 걸리는 최단거리 저장소 

    heapq.heappush(visited, (0, start))
    min_value_store[start-1] = 0

    while visited:
        road_value, now_edge = heapq.heappop(visited) # now_edge까지 걸리는 가중치 = now_value

        if min_value_store[now_edge-1] < road_value: # 새로 방문한 길이 더 오래걸리는 경우 continue
            continue

        for next_edge, next_value in city[now_edge].items():
            cost = road_value + next_value

            if min_value_store[next_edge-1] > cost:
                min_value_store[next_edge-1] = cost
                heapq.heappush(visited, (cost, next_edge))
    # print(min_value_store)
    return min_value_store[end-1]

result = 0
for home in range(1, town_count + 1):
    go = dijkstra(home, party_town) # 집에서 부터 파티타운까지 최단거리
    back = dijkstra(party_town, home) # 파티타운에서 집까지 최단거리
    # print(f'확인하려는 곳 = {home}, 파티장 = {party_town}, 가는 곳 최소 = {go}, 오는 곳 최소 = {back}')
    result = max(result, go + back)
print(result)