//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

let sum = [1,2,3].reduce(0) {$0 + $1}
print(sum)

let sorted = [2,4,1,6,5].sorted {$0 < $1}
print(sorted)

var dicto = [String:Int]()
dicto = ["Stanio": 1, "Zhopio": 2]

for (key, value) in dicto {
    print(key)
}

var strang = "jksjkds"
for c in strang.characters {
    print(c)
}
var timeInterval = TimeInterval(-800)
var date = Date()

var dateThen = date.addingTimeInterval(timeInterval)

true && false

abs(-10)


enum HTTPResponse {
  case ok
  case error(Int)
}

let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
let sortedResponses = responses.sorted {
  switch ($0, $1) {
  // Order errors by code
  case let (.error(aCode), .error(bCode)):
    return aCode < bCode
    
  // All successes are equivalent, so none is before any other
  case (.ok, .ok): return false
    
  // Order errors before successes
  case (.error, .ok): return true
  case (.ok, .error): return false
  }
}
print(sortedResponses)
// Prints "[.error(403), .error(404), .error(500), .ok, .ok]"


let sortedByAbs = [-10,2,4,1,6,5].sorted(by: abs(>))
print(sortedByAbs)
