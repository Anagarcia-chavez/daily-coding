import math

def print_board(board):
    for i in range(0, 9, 3):
        print(f" {board[i]} | {board[i+1]} | {board[i+2]} ")
        if i < 6:
            print("---+---+---")

def check_winner(board):
    wins = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
    for a, b, c in wins:
        if board[a] == board[b] == board[c] != " ":
            return board[a]
    if " " not in board:
        return "Tie"
    return None

def minimax(board, depth, is_maximizing):
    winner = check_winner(board)
    if winner == "O":
        return 1
    if winner == "X":
        return -1
    if winner == "Tie":
        return 0

    if is_maximizing:
        best_score = -math.inf
        for i in range(9):
            if board[i] == " ":
                board[i] = "O"
                score = minimax(board, depth + 1, False)
                board[i] = " "
                best_score = max(score, best_score)
        return best_score
    else:
        best_score = math.inf
        for i in range(9):
            if board[i] == " ":
                board[i] = "X"
                score = minimax(board, depth + 1, True)
                board[i] = " "
                best_score = min(score, best_score)
        return best_score

def best_move(board):
    best_score = -math.inf
    move = None
    for i in range(9):
        if board[i] == " ":
            board[i] = "O"
            score = minimax(board, 0, False)
            board[i] = " "
            if score > best_score:
                best_score = score
                move = i
    return move

def main():
    board = [" "] * 9
    print("You are X. Enter a position 0-8 (left to right, top to bottom).")
    print_board(board)

    while True:
        move = int(input("Your move: "))
        if board[move] != " ":
            print("Spot taken, try again.")
            continue
        board[move] = "X"

        if check_winner(board):
            break

        ai_move = best_move(board)
        board[ai_move] = "O"
        print_board(board)

        winner = check_winner(board)
        if winner:
            break

    result = check_winner(board)
    print_board(board)
    print("Tie game." if result == "Tie" else f"{result} wins!")

if __name__ == "__main__":
    main()