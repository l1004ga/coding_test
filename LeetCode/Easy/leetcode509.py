# 타뷸레이션

class Solution:
    def fib(self, n: int) -> int:
        dp = {}
        if n <= 1:
            return n
        
        dp[0] = 0
        dp[1] = 1

        for i in range(2, n):
            dp[i] = dp[i-1] + dp[i-2]

        return dp[n]

a = Solution()
Solution.fib(a, n=4)