// 2021.01.16 extramilejin

// problem link: https://programmers.co.kr/learn/courses/30/lessons/42862?language=swift

//풀이: lost 기준 OR 연산을 통해 greedy 구현 

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var newLost: [Int] = lost
    var newReserve: [Int] = reserve
    var answer: Int = n - lost.count
    var count: Int = 0
    
    // 여분을 도난 당한 경우
    
    for (i,numI) in newLost.enumerated() {
        for (j,numJ) in newReserve.enumerated() {
            if numI == numJ {
                newLost[i] = -1
                newReserve[j] = -1
                count += 1
                break
            }
        }
    }
    
    for (i,numI) in newLost.enumerated() {
        for (j,numJ) in newReserve.enumerated() {
           if(numJ == numI - 1 || numJ == numI + 1) {
               newReserve[j] = -1
               count += 1
               break
           }
        }
    }
    
    answer += count
    
    return answer
}
