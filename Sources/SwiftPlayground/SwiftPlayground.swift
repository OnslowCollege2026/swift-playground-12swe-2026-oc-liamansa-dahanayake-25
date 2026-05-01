// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

@main
struct SwiftPlayground {
    static func main() {

let kumaraPricePerKilo: Double = 3
let bagCost: Double = 0.20
let maximumBags: Int = 5000
let minimumKumaraWeight: Double = 0.1
let maxWeightForBag: Int = 5
let maxStock: Double = 50


var kumaraStock: Double = 0
var bagStock: Int = 5000

var sales: [(Double, Int)] = []


func sale(weight: Double, bags: Int) {
    let kumaraCharge = Double(weight) * kumaraPricePerKilo
    print("Kumara charge: $ \(kumaraCharge)")
    let bagCharge = Double(bags) * bagCost 
    print("Bag charge: \(bagCharge)")

    let totalCharge = kumaraCharge + bagCharge
    print("Total charge: $ \(totalCharge)")

    print("Do you want to purchase? [Y/N]")
    guard let input = readLine(), input.uppercased() == "Y" || input.uppercased() == "N" else {
        print("Invalid Input")
        return sale(weight:weight, bags:bags)
    }
    kumaraStock = kumaraStock - weight
    bagStock = bagStock - bags
    sales.append((weight, bags))
}

func addStock() {
    print("Enter stock amount:")
    guard let input = readLine(), let stock = Double(input), stock > 0 && stock <= maxStock else {
        print("Invlid stock, maximum stock amount should be 1 - 50 .")
        return addStock()
    }
    if (kumaraStock + stock) <= maxStock {
        kumaraStock += stock
        print("Stock updated!. Current stock: \(kumaraStock)")
    } else {
        print("Maximum stock value exceeded. Only \(maxStock - kumaraStock) stocks can be added.")
        return addStock()
    }
}

func viewStock() {
    print("Remaining stocks: \(kumaraStock)")
}


func salesRecords() {
    if sales.isEmpty {
        print("No records.")
    } else {
        print("Sales records: ")
        for sale in sales {
            print(" Weight: \(sale.0), Bags: \(sale.1)")
        }
    }
}


func calculateSummery() {
    var totalWeight: Double = 0
    var totalBags = 0 
    var totalPrice: Double = 0 

    for sale in sales {
        totalWeight += sale.0 
        totalBags += sale.1 
        totalPrice += Double(sale.0) * kumaraPricePerKilo
    }
}
    let averageWeightPerBag = totalWeight/Double(totalBags)
    let averageEariningPerBag = totalPrice/Double(totalBags)
    
    print("Average weight sold per bag: \(averageWeightPerBag)")
    print("Average amount earned per bag: \(averageEariningPerBag)")

func ownerMenu() {
    print("""
    == Ownner menu ==
        1. Add stock
        2. View remaining stocks
        3. Previous sales records
        4. Summery Information 
        5. Main menu 
    """)

    guard let input = readLine(), input != "" else {
            print("Input cannot be empty.")
            continue
        }
        
        guard let choice = Int(input) else {
            print("Invalid choice. Please try again.")
            return ownerMenu()
        }

    if choice == 1 {
            addStock()
        } else if choice == 2 {
            viewStocks()
        } else if choice == 3 {
            salesRecords()
        } else if choice == 4 {
            calculateSummery()
        } else if choice == 5 {
            return
        }
    } while true
}

func customerMenu() {
    print("""
    == customer Menu ==

        Enter Weight:
    """)
    guard let input = readLine(), let weight = Int(input) else {
        print("Invalid number of bags. Please try again.")
        return customerMenu()
        }
        if weight < minimumKumaraWeight || weight > kumaraStock {
        print("You can only buy kumara weight between \(minimumKumaraWeight) and \(kumaraStock).")
        return customerMenu()
        }
        print("Enter bag used")
        guard let input = readLine(), let bags = Int(input) else {
            print("Invalid number of bags. Please try again.")
            return customerMenu()
            if bags < 1 || bags > bagStock {
        print("Number of bags has to be between one and \(bagStock).")
        return customerMenu()
    }
    sale(weight:weight, bags:bags)
}
    }
}


repeat {
    print("Welcome to Kumara Shop!")
    
    print("""
        == Main Menu ==
            1. Ownner
            2. Customer
            3. Exit
            Choose an option:
    """)
    
    guard let input = readLine(), input != "" else {
        print("Input cannot be empty.")
        continue
    }
    guard let choice = Int(input) else {
        print("Invalid input. Please enter an option.")
        continue
    }

    if choice == 2 {
        customerMenu()
    } else if choice == 1 {
        ownerMenu()
    } else if choice == 3 {
        break // Exit the program.
    } else {
        print("Invalid option. Please try again.")
    }
    
} while true
