require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100)

get '/' do
  guess = params['guess']
  guess_status = check_guess(guess, secret_number)
  erb :index, :locals => {:number => secret_number, :guess_status => guess_status}
  
end

def check_guess(guess, secret_number)
  if guess.to_i == secret_number
    guess_status = "You got it right!"
  elsif guess.to_i > secret_number
    if guess.to_i.between?(secret_number, secret_number + 5)
      guess_status = "Too high!"
    else
      guess_status = "Way too high!"
    end
  elsif guess.to_i < secret_number
    if guess.to_i.between?(secret_number - 5, secret_number)
      guess_status = "Too low"
    else
      guess_status = "Way too low!"
    end
  end
end


