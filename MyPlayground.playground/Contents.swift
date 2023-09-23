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
