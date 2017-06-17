require 'sinatra'
require 'sinatra/reloader'

random = rand(101)

get '/' do
  "The SECRET NUMBER is #{random}."
end
