require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/solution.sqlite3"}

get '/' do
  erb :index
end

get '/purchase' do

end

post '/purchase' do

end