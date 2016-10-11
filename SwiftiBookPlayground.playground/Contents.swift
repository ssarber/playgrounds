//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Double {
  func absoluteValue(int: Double) -> Double {
    return abs(int)
  }
}

var d = Double()
print(d.absoluteValue(int: -1))