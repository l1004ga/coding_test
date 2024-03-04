class Solution {
    func trap(_ height: [Int]) -> Int {
        var score = 0
        var standard = Int(height.firstIndex(of: height.max()!)!) 
        
        if standard == 0 {
            score += stopper(height: height, standard: standard) 
        } else if  standard == height.count-1  {
            var newheight = Array(height.reversed())
            score += stopper(height: newheight, standard: Int(newheight.firstIndex(of: newheight.max()!)!))
        }
        else {
            score += stopper(height: height, standard: standard)
            let newheight = Array(height.reversed())
            score += stopper(height: newheight, standard: Int(newheight.lastIndex(of: newheight.max()!)!))
        }
        return score
}
    
    func stopper(height: [Int], standard: Int) -> Int {
        var top = standard
        var count : Int = 0
        
        while top < h2 {
            let result = countRainPool(height: height, top: top, count: count) // 다음 top, 현재까지 count
            top = result.0
            count = result.1
        }
        return count
    }
    
    func countRainPool(height: [Int], top: Int, count: Int) -> (Int,Int) {
        var count = count
        let section = makeNewSection(height: height, top: top)
        var newtop = section.0
        let newnext = section.1
        if newnext - newtop == 1 && newnext == height.count - 1 {
            return (newtop, count)
        }
        for c in height[section.0+1...section.1-1] {
            count += height[section.1] - c
        }
        newtop = newnext
        
        return (newtop, count)
    }
    
    func makeNewSection(height: [Int], top: Int) -> (Int,Int) {
        var top : Int = top
        let next : Int = Int(height[top+1...height.count-1].firstIndex(of: height[top+1...height.count-1].max()!)!)
        let result : (Int,Int) = (top, next)
        if next == height.count-1 {
            return result
        }
        if next - top == 1 {
            
            top = next
            return makeNewSection(height: height, top: top)
        }
        return result
    }
}

ㅁㅇ