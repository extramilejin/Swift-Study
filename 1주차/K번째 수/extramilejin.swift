//2021.01.15

//단순 구현

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = [Int]()
    for command in commands {
        var resultArray: [Int] = [Int]()
        for index in command[0]-1...command[1]-1 {
            resultArray.append(array[index])
        }
        resultArray.sort(by: <)
        answer.append(resultArray[command[2]-1])
    }
    return answer
}
