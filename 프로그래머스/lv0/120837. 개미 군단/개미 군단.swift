//최소한의 병력 구성 필요(공격력이 큰 개미를 최대한 이용해야 함)

import Foundation

func solution(_ hp:Int) -> Int {
  var rest : Int = hp
  var result : Int = 0
  
  if rest % 5 != 0 {
    result += rest / 5
    rest = rest % 5

    if rest % 3 != 0 {
      result += rest / 3
      rest = rest % 3

      result += rest
      
    } else {
      result += rest / 3
    }

  } else {
    result = rest / 5
  }

    return result
}