require 'sinatra'
require 'sinatra/activerecord'
require_relative 'services/purchase_service'

set :database, {adapter: "sqlite3", database: "db/solution.sqlite3"}
PURCHASE_SERVICE = PurchaseService.new

get '/' do
  erb :index
end

get '/purchase' do
  PURCHASE_SERVICE.get_consolidated_data.to_json
end

post '/purchase' do
  PURCHASE_SERVICE.add_from_file params[:arquivo][:tempfile]
  redirect '/purchase'
end