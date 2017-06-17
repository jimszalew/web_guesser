require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
number = SECRET_NUMBER

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess,number)
  color = guess_style(guess,number)
  erb :index, :locals => {message: message, number: number, color: color}
end

def check_guess(guess, number)
  if (guess > number) && (guess < (number + 5))
    "Too high!"
  elsif (guess > number) && (guess > (number + 5))
    "Way too high!"
  elsif (guess < number) && (guess > (number - 5))
    "Too low!"
  elsif (guess < number) && (guess < (number + 5))
    "Way too low!"
  else
    "You got it right!\n\nThe SECRT NUMBER is #{number}"
  end
end

def guess_style(guess, number)
  check = check_guess(guess, number)
  if check == "Too high!" || check == "Too low!"
    "#ff6666"
  elsif check == "Way too high!" || check == "Way too low!"
    "#ff0000"
  else
    "#00ff00"
  end
end
