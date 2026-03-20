// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {

        let maximumGuesses = 5

        let size = 6 

        var ocean = Array(repeating: Array(repeating: "~", count: size), count:size)

        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        ocean[1][3] = "S"
        ocean[2][3] = "S"
        ocean[4][0] = "S"
        ocean[5][4] = "S"

        var progress = 1
        while progress < maximumGuesses {
        
        printBoard(guesses)

        var progress = 1 
        while progress < maximumGuesses {
            print("\(progress): Please enter a row umber, press Enter, then column number:")

            guard let userInput = readLine(),
            let userInput2 = readLine(),
            let col = Int(userInput2) else {
                print("Your guess is Invalid. Try agian.")
                continue
            }



        let oldGuesses = guesses

        // by this poit in the code, the row and col must be valid integers.
        // let processGuess to checj that thay also valid guesses
        let newGuesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)

        // Only go to the newt move if the guesses board was update (i.e. a valid guess)
        if oldGuesses != newGuesses {
            progress = progress + 1
            guesses = newGuesses
        }




        ///Parameter:
        /// - Board: the 2D grid to display
        func printBoard(_ board: [[String]]) {
            var columnLabels = " "
            for i in 1...board.count {
                columnLabels = columnLabels + "\(i)"
            }
            print(columnLabels)
        }

        for (index, row) in board.enumerated() {
            var rowString = "\(index + 1)"
            for cell in row {
                rowString = rowString + cell + " "
        }
        print(rowString)

            ///parameters:
            /// - row: the row inndex for the huess.
            /// - col: the column index for guess.
            /// - ocean: the hidden shipd grid.
            /// - guesses - the player's curret husses grid.
            /// 
            /// Returns: the updated guesses grd after the guess is applied
            func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]]{
                guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
                    return guesses
                }
            }

            // Make sure that the user hasn't already guessed the position.
            // If not, exit this function early.
            guard guesses[ row - 1][ col - 1] != "O" && guesses[ row - 1][ col - 1] != "X" else {
                print(" You have already guessed that position. Try again.")
                return guesses 
            }

            guard guesses[row - 1][col - 1] != "~" else {
                print("MISS!")
                var newGuesses = guesses 
                newGuesses[row - 1][col - 1] = "O"
                return newGuesses
            }

            print("You've sunk my battleship!")
            var newGuesses = guesses
            newGuesses[row - 1][col - 1] = "X"
            return newGuesses

        } 

            ///Parameters:
            /// - ocean: the hidden ships grid.
            /// - guesses: the player's current guesses grid
            /// 
            /// Returns: how many ships remain unit.
            func remaingingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
                var shipCount = 0
                for row in 0... ocean.count-1 {
                    for col in 0...row {
                        if ocean[row][col] == "S" {
                        shipCount = shipCount + 1
                    }
                }
            }

            var hitCount = 0
            for row in 0... guesses.count-1 {
                for col in 0...row {
                    if guesses[row][col] == "X" {
                        hitCount = hitCount + 1
                    }
                }
            }
            return shipCount - hitCount

        }
    }
}