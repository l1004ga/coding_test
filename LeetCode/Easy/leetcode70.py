import collections

class Solution:
    dp = collections.defaultdict(int)
    # Memoization: (=local cache)
    count = 0
    def climbStairs2(self, n: int) -> int:
        # number of calling: 2*n - 3
        self.count += 1
        print(self.count)
        if n <= 2:
            return n
        
        if self.dp[n]: # 어디서 적용되는 케이스인지 모르겠음
            return self.dp[n]
        
        self.dp[n] = self.climbStairs(n=n-1) + self.climbStairs(n=n-2)
        return self.dp[n]

    def climbStairs(self, n: int) -> int:
        # number of calling: 2^n
        self.count += 1
        print(self.count)
        if n <= 2:
            return n
        
        return self.climbStairs(n=n-1) + self.climbStairs(n=n-2)

'''
f(n): n'th count
f(n) -> "1+ from last step" AND "2+ from second last stop" -> f(n) = f(n-1) + f(n-2)

Naive way: O(2^n)
Memoization applied: f(n = 10), number of calling of climbStairs2 is ...

g(n): n'th count, with one step, two step, three step
g(n) = g(n-1) + g(n-2) + g(n-3)
Naive way: O(3^n)

f(10) -> 2^10 f(1)


f(5)
f(4) f(3)
f(3) f(2) f(2) f(1)
f(2) f(1) f(1) f(0) f(1) f(0) f(1)
'''


# class Solution:
#     def climbStairs(self, n: int) -> int:
#         dp = {}

#         if n <= 2:
#             return n
        
#         dp[1] = 1
#         dp[2] = 2

#         for i in range(3,n+1):
#             dp[i] = dp[i-1] + dp[i-2]

#         return dp[n]
        


a = Solution()
print(Solution.climbStairs(a, 30))