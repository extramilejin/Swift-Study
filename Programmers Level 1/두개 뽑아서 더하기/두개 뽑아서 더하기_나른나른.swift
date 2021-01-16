//
//  나른나른_두개 뽑아서 더하기.swift
//  Created by Heyziin on 2021/01/15.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
  var rst: [Int] = []
  var set: Set<Int> = []
  
  for i in 0..<numbers.count {
    for j in 0..<numbers.count {
      if i != j {
        set.insert(numbers[i] + numbers[j])
      }
    }
  }
  rst = Array(set).sorted()
  
  return rst
}
