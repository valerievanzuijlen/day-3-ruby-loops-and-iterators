#!/usr/bin/ruby

secret_num = 1 + rand(100)
guess = 0
cnt = 0

while cnt < 10
    puts 'Make a guess?'
    guess = gets
    guess = guess.to_i
    if guess == secret_num
        puts 'You win!!'
        break
    else
        puts guess > secret_num ? 'Lower' : 'Higher'
    end
    cnt += 1
end

puts 'GAME OVER!'
