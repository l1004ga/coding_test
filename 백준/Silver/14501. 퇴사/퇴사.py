import sys

day = int(input())
consult = [list(map(int, sys.stdin.readline().split())) for i in range(day)]

dp = [0 for _ in range(day + 1)]

for i in range(day-1, -1, -1): # 6,5,4,3,2,1,0
    if i + consult[i][0] > day:
        dp[i] = dp[i+1]
    else:
        dp[i] = max(dp[i+1], consult[i][1] + dp[i + consult[i][0]])

print(dp[0])