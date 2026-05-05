// The Swift Programming Language
// https://docs.swift.org/swift-book



@main
struct SwiftPlayground {
    static func main() {

// Constants
let kumaraPricePerKilo: Double = 3
let bagCost: Double = 0.20
let maximumBags: Int = 5000
let minimumKumaraWeight: Double = 0.1
let maxWeightForBag: Int = 5
let maxStock: Double = 50

// Variables 
var kumaraStock: Double = 0
var bagStock: Int = 5000

// Stores all completed sales as (weight in kg, number of bags) tuples.
var sales: [(Double, Int)] = []

// Calculates and displays the cost breakdown for a purchase.
// Updates the stokc and records the sale if the customer comfirms.
/// 
/// - Parameters:
///   - weight: The weight of kumara being purchased in kilograms.
///   - bags: The number of bags requested.
func sale(weight: Double, bags: Int) {
    let kumaraCharge = Double(weight) * kumaraPricePerKilo
    print("Kumara charge: $ \(kumaraCharge)")
    let bagCharge = Double(bags) * bagCost 
    print("Bag charge: \(bagCharge)")

    let totalCharge = kumaraCharge + bagCharge
    print("Total charge: $ \(totalCharge)")
    // This prompt customer to comfirm or cancel purchase.
    print("Do you want to purchase? [Y/N].")
    guard let input = readLine(), input.uppercased() == "Y" || input.uppercased() == "N" else {
        print("Invalid Input.")
        return sale(weight:weight, bags:bags)
    }
    kumaraStock = kumaraStock - weight
    bagStock = bagStock - bags
    sales.append((weight, bags))
}

// Owner functions.
/// Prompts the owner to add kumara stock, validating that the amount if 
/// within acceptable bounds and doesn't exceed the maximum stock capacity.
func addStock() {
    print("Enter stock amount:")
    guard let input = readLine(), let stock = Double(input), stock > 0 && stock <= maxStock else {
        print("Invlid stock, maximum stock amount should be 1 - 50 .")
        return addStock()
    }
    // Check adding the new stock won't exceed the maximum capacity.
    if (kumaraStock + stock) <= maxStock {
        kumaraStock += stock
        print("Stock updated!. Current stock: \(kumaraStock)")
    } else {
        print("Maximum stock value exceeded. Only \(maxStock - kumaraStock) stocks can be added.")
        return addStock()
    }
}

// Displays all previously completed sale records, showing the weight and bags per transaction.
func viewStocks() {
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

/// Calculates and displayes a summery if all sales, including:
/// - Average weight of kumara sold per bag.
/// - Avarage earning per bag (excluding the bag charges).
func calculateSummery() {
    var totalWeight: Double = 0
    var totalBags = 0
    var totalPrice: Double = 0
    // Gathers totals across the records.
    for sale in sales {
        totalWeight += sale.0
        totalBags += sale.1
        totalPrice += Double(sale.0) * kumaraPricePerKilo
    }
    let averageWeightPerBag = totalWeight/Double(totalBags)
    let averageEariningPerBag = totalPrice/Double(totalBags)
    
    print("Average weight sold per bag: \(averageWeightPerBag) kg.")
    print("Average amount earned per bag: \(averageEariningPerBag)")
    }

/// Displayes the owner menu in a loop, allowing the owner to manage stock, 
/// view records, and access summeries until they choose to return the mainn menu.
func ownerMenu() {
    repeat {
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

func getBags(weight: Double)-> Int {
print(" Enter bag used: ")
    // Validate bag count input is a valid interger.
    guard let input = readLine(), let bags = Int(input) else {
        print("Invalid number of bags. Please try again.")
        return getBags(weight: weight)
    }
    // Ensure bag count is within the available range.
    if bags < 1 || bags > maximumBags {
        print("Number of bags has to be between one and \(maximumBags).")
        return getBags(weight:weight)
    } else if bags > bagStock { // Ensure number of bags does not exceed available bags in stock.
        print("Not enough bags in stock. Only \(bagStock) bags available")
        return getBags(weight:weight)
    } else if (weight/Double(bags)) > Double(maxWeightForBag) { // Ensure a bag does not contain more than 5kg of Kumara.
        print("A bag cannot have more than \(maxWeightForBag)kg.")
        return getBags(weight:weight)
    }
    return bags;
}

// Custmor functions.

/// Guides the customer through a purchase by collecting their kumara weight
/// and number if bags, validating both inputs before proceeding to the sale.
func customerMenu() {
    print("""
    
    == Customer Menu ==
    
        Enter weight:
    """)
    
    // Validate weight input is a valid number.
    guard let input = readLine(), let weight = Double(input) else {
        print("Invalid weight. Please try Again.")
        return customerMenu()
    }
    // Ensure weight is wintin the allowed purchage range.
    if weight < minimumKumaraWeight || weight > kumaraStock {
        print("You can only buy kumara weight between \(minimumKumaraWeight) and \(kumaraStock).")
        return customerMenu()
    }
    let bags = getBags(weight:weight)
}


// Main menu.
repeat {
    print(" ==== Welcome to Kumara Shop! ====")
    
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
        break // Exits the program.
    } else {
        print("Invalid option. Please try again.")
    }
} while true


    }
}