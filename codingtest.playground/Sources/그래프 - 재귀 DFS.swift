/*
 DFS 재귀
 */


let grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

class Solution {
    func numIslands(_ grid : [[Character]]) -> Int {
        
        var grid = grid
        var islandCount : Int = 0
        
        for row in 0...grid.count - 1 {
            for col in 0...grid[0].count - 1 {
                if grid[row][col] == "1" {
                    dfs(&grid, row, col)
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
    func dfs(_ grid : inout [[Character]], _ row : Int, _ col : Int) {
        
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] == "0" || grid[row][col] == "*" {
            return
        }
        
        grid[row][col] = "*"
        
        dfs(&grid, row, col+1)
        dfs(&grid, row+1, col)
        dfs(&grid, row, col-1)
        dfs(&grid, row-1, col)
        
        
    }
}


var solution = Solution()
test([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ], 1)
test([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ], 3)


func test(_ grid: [[Character]], _ count: Int) {
    if Solution().numIslands(grid) == count {
        print("\(Solution().numIslands(grid)):\(count) - True")
    } else {
        print("\(Solution().numIslands(grid)):\(count) - False")
    }
}


























/*
 class Solution {

 func numIslands(_ grid: [[Character]]) -> Int {
     var graph = grid
     var island : Int = 0
     
     // 첫째, 마지막 행 탐색
     for y in 0...(graph[0].count - 1) {
         for x in 0...(graph.count - 1) {
             if graph[x][y] == "1" {
                 dfs200(graph: &graph, vertex: (x,y))
                 island += 1
             }
         }
     }
     
     return island
 }

 //dfs 재귀호출 함수
 func dfs200(graph : inout [[Character]], vertex : (Int, Int)) { // inout 참조된 원본 변경, vertex = 현재 위치 행렬
     if vertex.0 < 0 || vertex.1 < 0 || vertex.0 >= graph.count || vertex.1 >= graph[0].count || graph[vertex.0][vertex.1] == "0" || graph[vertex.0][vertex.1] == "^"  {
         return
     }
     graph[vertex.0][vertex.1] = "^" //영어 O
     for w in [(vertex.0 - 1, vertex.1),(vertex.0, vertex.1 - 1),(vertex.0 + 1, vertex.1),(vertex.0, vertex.1 + 1)] {
         dfs200(graph: &graph, vertex: w)
     }
 }

 }
 */
