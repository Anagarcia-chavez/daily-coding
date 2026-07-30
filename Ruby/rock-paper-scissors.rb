CHOICES = ["rock", "paper", "scissors"]

def computer_choice
  CHOICES.sample
end

def valid_choice?(choice)
  CHOICES.include?(choice)
end

def winner(player, computer)
  return "tie" if player == computer

  case [player, computer]
  when ["rock", "scissors"], ["scissors", "paper"], ["paper", "rock"]
    "player"
  else
    "computer"
  end
end

def play_round
  print "Choose rock, paper, or scissors: "
  player = gets.chomp.downcase

  unless valid_choice?(player)
    puts "Not a valid choice, try again."
    return
  end

  computer = computer_choice
  puts "Computer chose #{computer}."

  result = winner(player, computer)
  case result
  when "tie"
    puts "It's a tie!"
  when "player"
    puts "You win!"
  else
    puts "Computer wins!"
  end
end

def main
  puts "Rock, Paper, Scissors! Type 'quit' to stop."

  loop do
    print "\nReady? (press enter, or type 'quit') "
    input = gets.chomp.downcase
    break if input == "quit"

    play_round
  end

  puts "Thanks for playing!"
end

main