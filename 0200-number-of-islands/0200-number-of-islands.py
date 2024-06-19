class Solution:
    
    def numIslands(self, grid: List[List[str]]) -> int:
        
        def dfs(grid, x, y):
            if x < 0 or x >= len(grid) or y < 0  or y >= len(grid[0]) or grid[x][y] != '1':
                return
        
            grid[x][y] = '2' 

            dfs(grid, x-1, y)
            dfs(grid, x+1, y)
            dfs(grid, x, y-1)
            dfs(grid, x, y+1)
        
        count = 0
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == '1':
                    dfs(grid,i,j)
                    count += 1
        return count
        