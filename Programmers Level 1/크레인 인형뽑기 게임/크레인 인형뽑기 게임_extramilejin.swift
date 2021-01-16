// 문제 링크: https://programmers.co.kr/learn/courses/30/lessons/64061?language=swift

// 간략 풀이: bucket을 스택으로 구현, 주어진 board와 move 배열을 순회하며 버켓에 들어갈 아이템과 버켓의 top이 동일하면 answer값에 2를 더해준다.

import Foundation

public struct Stack<Element> {
    
    private var storage = Array<Element>()
    public init(_ element: [Element]) {
        storage = element 
    }
    public init() {}
    
    public mutating func push(_ element: Element) { 
        storage.append(element)
    }
    
    @discardableResult 
    public mutating func pop() -> Element? { 
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    } 
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var newBoard: [[Int]] = board
    var answer: Int = 0
    var bucket: Stack<Int> = Stack<Int>()
    let sizeOfBoard: Int = board.count
    
    for move in moves {
        var nextItem: Int = 0
        for row in 0..<sizeOfBoard {
            if newBoard[row][move-1] != 0{
                nextItem = newBoard[row][move-1]
                newBoard[row][move-1] = 0 
                break
            }
        }
        
        if(nextItem == 0) {continue}
        
        if bucket.isEmpty {
            bucket.push(nextItem)
        }
        else if bucket.peek()! == nextItem {
            answer += 2
            bucket.pop()
        } 
        else {
            bucket.push(nextItem)
        }
    }
    
    return answer
}
