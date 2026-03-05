// The Swift Programming Language
// https://docs.swift.org/swift-book



@main
struct SwiftPlayground {
    static func main() {

var eggsInStock = 0
var eggsSold = 0
let maxAmount = 1000
let lowStock = 50

// Functions
func menuName() -> Int {
    print("""
    ==== Egg Shop ====
    1. Add eggs
    2. Sell eggs
    3. Show current stock
    4. Show total eggs sold
    5. Exit
    Choose an option:
    """)

guard let input = readLine(), let choice = Int(input) else {
    print("Invalid input. Please enter a number.")
    return 0
    }
    return choice
}

func theQuantity(prompt: String) -> Int? {
    print(prompt)
    guard let input = readLine(), let amount = Int(input) else {
        print("Invalid input. please enter a whole number.")
        return nil
    }
    if amount < 1 {
        print(" Quantity must be at least 1. Please try again.")
        return nil
    }
}

func addEggs(currentStock: Int, amount: Int) -> Int? {
    let newStock = currentStock + amount
    if newStock > maxAmount {
        print("Cannot exceed \(maxAmount) eggs inn stock.")
    }
    return newStock
}


func sellEggs(currentStock: Int, amount: Int) -> Int? {
    if amount < currentStock {
        print("Cannot sell more than eggs than are in stock.")
    }
    return currentStock - amount
}

func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    return currentSold + amount
}

func stockMessage(stock: Int) -> String {
    if stock == 0 {
        return "Stock is empty. You have no eggs."
    } else if stock < lowStock {
        return "Current \(stock) eggs. Low in stock."
    } else {
        return "Current \(stock) eggs."
    }
}

func soldMessage(totalSold: Int) -> String {
    return "Total eggs sold today is \(totalSold)."
}

func resetShop() {
    eggsInStock = 0
    eggsSold = 0
    print("Shop has been reset to a new day. The stock and the sold amount is reseted.")
}



// Main loop.
var running = true

while running {
    let choice = menuName()


switch choice {
    case 1:
    if let amount = theQuantity(prompt:"How many eggs would you like to add?") {
        if let newStock = addEggs(currentStock: eggsInStock, amount: amount) {
            eggsInStock = newStock
            print(stockMessage(stock: eggsInStock))
        }
    }


    case 2:
    if let amount = theQuantity(prompt:"how many eggs would you like to sell? ") {
        if let newStock = sellEggs(currentStock: eggsInStock, amount: amount) {
            eggsInStock = newStock
            eggsSold = updateSoldCount(currentSold: eggsSold, amount: amount) 
            print("Sale completed.")
            print(stockMessage(stock: eggsInStock))
            print(soldMessage(totalSold: eggsSold))
        }
    }


    case 3:
    print(stockMessage(stock: eggsInStock))

    case 4: 
    print(soldMessage(totalSold: eggsSold))


    case 5:
    print("Exiting egg Shop. Goodbye!")
    running = false

    case 6:
    resetShop()

    case  0:
    continue

    default:
    print("Invalid menu option. Please choose 1-6.")

    }
}





}
    }