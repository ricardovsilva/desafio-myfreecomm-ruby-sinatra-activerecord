require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/solution.sqlite3"}

