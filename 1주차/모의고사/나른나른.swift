//
//  나른나른_모의고사.swift
//  Created by Heyziin on 2021/01/15.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
  var rst: [Int] = []
  
  let p1: [Int] = [1, 2, 3, 4, 5]
  let p2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
  let p3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
  
  var score1: Int = 0
  var score2: Int = 0
  var score3: Int = 0
  
  answers.enumerated().forEach { (index, elem) in
    if elem == p1[index % 5] {
      score1 += 1
    }
    
    if elem == p2[index % 8] {
      score2 += 1
    }
    
    if elem == p3[index % 10] {
      score3 += 1
    }
  }
  
  let maxScore = max(max(score1, score2), score3)
  
  if maxScore == score1 {
    rst.append(1)
  }
  
  if maxScore == score2 {
    rst.append(2)
  }
  
  if maxScore == score3 {
    rst.append(3)
  }
  
  return rst
}
