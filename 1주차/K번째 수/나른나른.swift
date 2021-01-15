//
//  나른나른_K번째수.swift
//  Created by Heyziin on 2021/01/15.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
  var rst: [Int] = []
  
  var i: Int = 0
  var j: Int = 0
  var k: Int = 0
  
  for index in 0..<commands.count {
    i = commands[index][0] - 1
    j = commands[index][1] - 1
    k = commands[index][2] - 1
    
    let arr = array[i...j].sorted(by: <)
    rst.append(arr[k])
  }
  return rst
}
