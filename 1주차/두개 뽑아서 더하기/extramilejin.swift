// 풀이: 중복을 방지하고자 visited 배열 선언

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var arr: [Int] = [Int]()
    var visited: [Bool] = Array(repeating: false, count: 201)
    
    for (i,numi) in numbers.enumerated() {
        for (j,numj) in numbers.enumerated(){
            if i != j && visited[numi+numj] == false {
               visited[numi+numj] = true
            }
        }
    }
    
    for i in 0..<201 {
        if visited[i] == true {arr.append(i)}
    }
    
    return arr.sorted(by: <)
}
