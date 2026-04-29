// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

@main
struct SwiftPlayground {
    static func main() {

let kumaraPricePerKilo: Double = 3 
let bagCost: Double = 0.20
let maximumBags: Int = 5000
let maximumKumaraWeight: Double = 0.1
let maxWeightForBag: Int = 5 
let maxStock: Int = 50

var kumaraStock: Int = 0
var bagStock: Int = 5000

var sales: [[Int]] = [[]]

var option = 0



func sale(weight: Int, bags: Int) {
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
    sales.append([weight, bags])
}

func addStock() {
    print("Enter stock amount:")
    guard let input = readLine(), let stock = Int(input), stock > 0 && stock <= maxStock else {
        print("Invlid stock amount.")
        return addStock()
    }
    kumaraStock += stock 
    print("Stock updated!. Current stock \(kumaraStock)")
}

func viewStock() {
    print("Remaining stocks: \(kumaraStock)")
}


func salesRecords() {
    print("Sales records: ")
    for i in 0..<sales.count {
        print("Weight: \(sales[i][0]), Bags: \([i][1])")
    }
}

func ownerMenu() {
    print("""
    == Ownner menu ==
        1. Add stock
        2. View remaining stocks
        3. Previous sales records
        4. Summery Information 
        5. Main menu 
    """)

    guard let input = readLine(), let choice = Int(input) else {
        print("Invalid choice. Please try again.")
        return ownerMenu()
    }
    if choice == 1{
    addStock()
    }else if choice == 2 {
    viewStock()
    } else if choice == 3 {
    salesRecords()
    }
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
        print("Enter bag used")
        guard let input = readLine(), let bags = Int(input) else {
            print("Invalid number of bags. Please try again.")
            return customerMenu()
    }
}



repeat {
    print("Welcome to Kumara shop!")

    print("""
    == Main Menu == 
        1.Owner
        2.Customer 
        3.Exit
    Choose an option:
    """)

    guard let input = readLine(), let choice = Int(input) else {
        print("Invalid input. Please enter an option.")
        exit(0)
    }
    option = choice

if option == 2 {
    customerMenu()
} else if option == 1 {
    ownerMenu()
}
} while option != 3

}
    }
