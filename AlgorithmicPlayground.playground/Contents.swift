//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Counting sort
enum CountingSortError: Error {
  case ArrayEmpty
}

func countingSort(theList: [Int], maxValue: Int) throws -> [Int] {
  
  guard theList.count > 0 else {
    throw CountingSortError.ArrayEmpty
  }
  
  // Create an array of 0s at indices 0...maxValue
  var numsToCounts = [Int](repeating: 0, count: maxValue+1)
  
  for item in theList {
    numsToCounts[item] += 1
  }

  var sortedList = [Int]()
  
  for (item, count) in numsToCounts.enumerated() {
    for _ in 0...count {
      sortedList.append(item)
    }
  }
  return sortedList
}
var a = [1, 4, 5, 6,7, 8, 2, 3]
try print(countingSort(theList: a, maxValue: 8))

//Given: sorted array of integers
//Return: sorted array of squares of those integers
//Ex: [1,3,5] -> [1,9,25]
//
//Integers can be negative.

// 1st approach
//
// 1) sort array by abs(x) as key (e.g. [1,2,3,-4,5,-6])
// 2) return [x**2 for x in array]

var b = [1, -4, 5, 6,7, 8, 2, 3]
func squares(theList:[Int]) -> [Int] {
//  let squares = [Int]()
  var absList = [Int]()
  for i in theList {
    let square = i*i
    absList.append(square)
  }
  return absList.sorted(by: <)
}
print(squares(theList: b))

func squaresMap(theList:[Int]) -> [Int] {

  let squares = theList.map({ number in number * number })
  let sortedSquares = squares.sorted(by: <)

  return sortedSquares
}
print(squaresMap(theList: b))

// 2nd approach
//
// 1) do sqr for all negative and reverse list, do sqr for positive
// 2) merge 2 arrays like in merge sort but only 1 iteration needed

func squaresBest(theList:[Int]) -> [Int] {
  var sortedSquares = [Int]()
  var negativeSquares = [Int]()
  var positiveSquares = [Int]()
  for i in theList {
    if i < 0 && i != 0 {
      let square = i*i
      negativeSquares.append(square)
    } else if i >= 0 {
        let square = i*i
        positiveSquares.append(square)
    }
  }
  sortedSquares = mergeArrays(arr1: negativeSquares, arr2: positiveSquares)
  
  return sortedSquares
  
}


// 1. We'll start at the beginnings of our input lists, since the smallest elements will be there.
// 2. As we put items in our final merged_list, we'll keep track of the fact that they're "already merged."
// 3. At each step, each list has a first "not-yet-merged" item.
// 4. At each step, the next item to put in the merged_list is the smaller of those two "not-yet-merged" items!

func mergeArrays(arr1:[Int], arr2:[Int]) -> [Int] {

  var myList = arr1
  var alicesList = arr2
  
  let mergedArraySize = arr1.count + arr2.count
  var mergedArray = [Int](repeating: 0, count: mergedArraySize)
  
  // Create variables to keep track of indices
  // of both arrays and the new merged array
  var currentIndexAlices = 0
  var currentIndexMine = 0
  var currentIndexMerged = 0
  
  while currentIndexMerged < mergedArraySize {

    // my list is over, continue iterating over Alice's list
    if currentIndexMine >= myList.count {
      mergedArray[currentIndexMerged] = alicesList[currentIndexAlices]
      currentIndexAlices += 1
    }

    else if currentIndexAlices >= alicesList.count {
      mergedArray[currentIndexMerged] = myList[currentIndexMine]
      currentIndexMine += 1
      
    }
    // case: next comes from my list
    else if myList[currentIndexMine] < alicesList[currentIndexAlices] {
      mergedArray[currentIndexMerged] = myList[currentIndexMine]
      currentIndexMine += 1
    } else { // case: next comes from Alice's list
      mergedArray[currentIndexMerged] = alicesList[currentIndexAlices]
      currentIndexAlices += 1
    }
    
    currentIndexMerged += 1
    
  }

  return mergedArray
}
let mixedList = [-10, -3, 1, 5, 8, 10, 14]
print(squaresBest(theList: mixedList))

let myList = [1, 5, 8, 10, 15]
let alicesList = [5, 6, 9, 12]
print(mergeArrays(arr1: myList, arr2: alicesList))


