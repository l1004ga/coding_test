func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var musicDict : [String:[(Int,Int)]] = [:]
    var result : [Int] = []
    
    for (num, genre) in genres.enumerated() {
        musicDict[genre, default: []].append((plays[num], num))
    }
    
    print(musicDict)
    
    var musicTupleList : [(String, [(Int,Int)])] = musicDict.enumerated().map{$0.element}
    print(musicTupleList)
    musicTupleList.sort(by: { x, y in
        return x.1.reduce(0, {$0 + $1.0}) > y.1.reduce(0, {$0 + $1.0})
    })
    
    
    for (key, value) in musicTupleList {
        var playcount = value.sorted(by: {
            return $0.0 > $1.0
        })
        
        if playcount.count < 2 {
            result.append(playcount[0].1)
            continue
        }
        result.append(playcount[0].1)
        result.append(playcount[1].1)
    }
    
    return result
}