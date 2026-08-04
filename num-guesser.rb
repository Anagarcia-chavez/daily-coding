def play
  secret_number = rand(1..100)
  attempts = 0
  max_attempts = 7

  puts "I'm thinking of a number between 1 and 100."
  puts "You have #{max_attempts} attempts to guess it."

  until attempts >= max_attempts
    print "\nYour guess: "
    input = gets.chomp

    unless input.match?(/\A\d+\z/)
      puts "Please enter a whole number."
      next
    end

    guess = input.to_i
    attempts += 1

    if guess == secret_number
      puts "You got it in #{attempts} attempts! The number was #{secret_number}."
      return true
    elsif guess < secret_number
      puts "Too low."
    else
      puts "Too high."
    end

    puts "Attempts left: #{max_attempts - attempts}"
  end

  puts "\nOut of attempts! The number was #{secret_number}."
  false
end

def main
  loop do
    play
    print "\nPlay again? (y/n) "
    break unless gets.chomp.downcase == "y"
  end
  puts "Thanks for playing!"
end

main