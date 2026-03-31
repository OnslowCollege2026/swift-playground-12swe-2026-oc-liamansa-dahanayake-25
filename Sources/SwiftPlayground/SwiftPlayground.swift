// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let vocabulary:[[String]] = [
            ["Hello", "Hola", "Kia Ora", "hila", "stupid"],
            ["GoodBye", "Adios", "Interesante", "Boleto", "Dumb"],
            ["Water", "Agua", "Carne", "Chair", "Table"],
            ["Annoying", "Molesto", "Computer", "Frame", "Legs"]
        ]
        var counter = 0
        var score = 0
        var incorrectAnswerIndicies: [Int] = []

        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let inccorectAnswerIndicies: [Int] = []
            let allAnswer = vocabulary[counter].dropFirst().shuffled()

            print("Please transalet \(englishWord)")
            allAnswer.forEach {answer in
            print("- \(answer)")
            }
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score = score + 1
                print ("Yes, \(correctWord) is correct.")
            }else {
                inccorectAnswerIndicies.append(counter)
                print("Sorry! the correct word is \(correctWord)")
            }
            counter = counter + 1
        }
        while incorrectAnswerIndicies.count > 0 {
            let englishWord = vocabulary[Index][0]
            let correctWord = vocabulary[Index][1]
            let allAnswer = vocabulary[counter].dropFirst().shuffled()

            print("Please transalet \(englishWord)")
            allAnswer.forEach {answer in
            print("- \(answer)")
            }
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score = score + 1
                print ("Yes, \(correctWord) is correct.")
            } else {
                IncorrectAnswerIndicies.append(counter)
                print("Sorry! the correct word is \(correctWord)")
            }
        }
        print("You have score of \(score)/ \(vocabulary.count)")
        if Double(score) >= Double(vocabulary.count / 2) {
            print("Congrats!")
        } else {
            print("Try Again next time.")
        }
    }
}
