import Foundation

// Task 1)

func minSplit(amount: Int) -> Int {
    let denominations = [50, 20, 10, 5, 1]
    var remainingAmount = amount
    var coinCount = 0
    
    for denomination in denominations {
        if remainingAmount >= denomination {
            let numberOfCoins = remainingAmount / denomination
            coinCount += numberOfCoins
            remainingAmount -= numberOfCoins * denomination
        }
    }
    
    return coinCount
}

minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)
minSplit(amount: 52626669)

// Task 2)

func sumOfDigits(_ start: Int,_ end: Int) -> Int {
    var sum = 0
    
    for number in start...end {
        let numberString = String(number)
        for character in numberString {
            if let digit = Int(String(character)) {
                sum += digit
            }
        }
    }
    
    return sum
}

sumOfDigits(19, 22) // Output: 19
sumOfDigits(7, 8) // Output: 15
sumOfDigits(17, 20) // Output: 29
sumOfDigits(10, 12) // Output: 6

// Task 3)

func isProperly(sequence: String) -> Bool {
    var stack = [Character]()
    
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false // Parentheses are not properly matched
            } else {
                stack.popLast()
            }
        }
    }
    
    return stack.isEmpty
}

isProperly(sequence: "(()())") // Output: true
isProperly(sequence: ")(()")  // Output: false
isProperly(sequence: "(()())(") // Output: false

// Task 4)

func countWays(n: Int, steps: [Int]) -> Int {
    let isFirstOne = (steps.first ?? 0) == 1
    let isLastOne = (steps.last ?? 0) == 1
    var count = 1
    var zerosCount = 0
    var onesCount = isFirstOne ? 1 : 0
    var previous = isFirstOne ? 1 : 0
    
    for i in 0..<n {
        
        if previous != steps[i] {
            let combinations = fib(num: onesCount)
            
            count *= (combinations > 0 ?  combinations : 1)
            
            if zerosCount > 1 {
                return 0
            }
            
            onesCount = 0
            zerosCount = 0
            previous = steps[i]
        }
        
        if steps[i] == 0 {
            zerosCount += 1
        }
        
        if steps[i] == 1 {
            onesCount += 1
        }
    }
    
    onesCount += isLastOne ? 1 : 0
    
    let combinations = fib(num: onesCount)

    count *= (combinations > 0 ?  combinations : 1)
    
    if zerosCount > 1 {
        return 0
    }
    
    return count
}

func fib(num: Int) -> Int{
    if (num == 0){
        return 0
    }
    else if (num == 1){
        return 1
    }
    return fib(num: num - 1) + fib(num: num -  2)
}

countWays(n: 2, steps: [1,1]) // ➞ 3
countWays(n: 3, steps: [1,0,0,1])   // ➞ 0
countWays(n: 3, steps: [1,0,1])   // ➞ 1
countWays(n: 3, steps: [0, 1, 0])    // ➞ 1
countWays(n: 4, steps: [0, 1, 1, 0])   // ➞ 1
countWays(n: 5, steps: [1, 1, 0, 1, 1]) // ➞ 4

// Task 5)

func zeros(N: Int) -> Int {
    var count = 0
    var n = N
    
    while n >= 5 {
        n /= 5
        count += n
    }
    
    return count
}

zeros(N: 7)  // Output: 1
zeros(N: 12) // Output: 2
zeros(N: 490) // Output: 120
zeros(N: 1000) // Output: 249
