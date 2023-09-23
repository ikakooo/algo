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

