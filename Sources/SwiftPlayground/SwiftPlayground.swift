// The Swift Programming Language
// https://docs.swift.org/swift-book

func print(board: [[String]]) {
    board.forEach { line in
        print("| \(line[0]) | \(line[1]) | \(line[2]))")
        print("--+---+--")
    }
    print()
}

func askForPosition(board: [[String]]) -> [Int] {
    while true {
    print("Please enter the row number: ")
    let userInput = readLine()!
    let rowNumber = Int(userInput)!

    print("Please enter the row number 1-3:")
    let userInput2 = readLine()!
    let columnNumber = Int(userInput)!

    if board[rowNumber][columnNumber] == "." {
        return [rowNumber, columnNumber]
        }
    }
}


@main
struct SwiftPlayground {
    static func main() {
        var player = "O"
        var board = [
            [".",".","."], //this is row 0
            [".",".","."], //this is row 1
            [".",".","."], //this is row 2
        ]
        print(board: board)

        // Ask for the user's move.
        let position = askForPosition(board: board)
        board[position[0]] [position[1]] = player


        print(board: board)

        if player == "O" {
            player = "X"
        }else { 
            player = "O"

        }




        // First move: 0 in middle.
        board[1][1] = "O"
        print(board: board)

        // Second move: X in top-left
        board[0][0] = "X"
        print(board: board)
        
        // Third move: 0 in top-right
        board[0][2]
        print(board: board)

        //Forth move: X in bottom-left
        board[2][0] = "O"

        // Fifth move: 0 in middle-right
        board[1][0] = "X"
        print(board: board)

        // Sixth move: O in bottom- middle
        board[2][1] = "O"
        print(board: board)
        
        // seventh move: X in bottom- middle
        board[0][1] = "X"
        print(board: board)




    }
}


