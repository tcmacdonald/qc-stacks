require 'sinatra'
require 'sinatra/sequel'

set :database, 'sqlite://db/qcs_development.sqlite'
dataset = database[:subscribers]

get '/' do
  n = rand(10000)
  dataset.insert({ name: "John Doe", email: "john#{n}@doe.com" })
  dataset.all.join(',')
end

