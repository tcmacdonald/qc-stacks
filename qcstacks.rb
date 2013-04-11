require 'sinatra'
require 'sinatra/sequel'

set :database, 'sqlite://db/qcs_development.sqlite'
dataset = database[:subscribers]

get '/' do
  dataset.all.join(',')
end

get '/test' do
  n = rand(10000)
  "Success!" if dataset.insert({ name: "John Doe", email: "john#{n}@doe.com" })
end
