// The Swift Programming Language
// https://docs.swift.org/swift-book


func readNumber(prompt: String) -> Double {
    print(prompt)
    print("Enter the room Length:")
            var roomLength = -1.0
            guard let  userInput = readLine(), let roomLength = Double(userInput), number > 0 else { 
                print("Invalid number. ")
                return readNumber (prompt:prompt)
            }
            returnValue = number
            return returnValue
}

@main
struct SwiftPlayground {
    static func main() {
            let maximumItemVolume = 2.0

            let roomLength = readNumber(prompt: "Enter the room Length")
            let roomWidth = readNumber(prompt: "Enter the room Length")
            let roomHeight = readNumber(prompt: "Enter the room Length")


            let roomArea = roomLength * roomWidth
            let roomVolume = roomArea * roomHeight
        print("room are \(roomArea) m² ")
        print("room are \(roomVolume) m³ ")

        let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]
        var totalFurnitureVolume = 0.0
        furnitureVolumes.enumerated().forEach { index, volume in 
        print("Item \(index + 1 ): \(volume) m³")
        if volume > maximumItemVolume {
        print("Oversized item detected.")
                    }
                    totalFurnitureVolume = totalFurnitureVolume + volume
                }
                let usableVolume = roomVolume - totalFurnitureVolume
                print("Usable volume \(usableVolume) m³")
            }
        }




