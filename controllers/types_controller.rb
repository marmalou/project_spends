require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/type')
also_reload('./models/*')

get '/types' do
  @types = Type.all
  erb(:"types/index")
end

get '/types/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @types = Type.all
  erb(:"types/new")
end

post '/types' do
  Type.new(params).save
  redirect to '/types'
end

get '/types/:id/edit' do
  @type= Type.find(params['id'])
  erb(:"types/edit")
end

post '/types/:id' do
  @type = Type.new(params)
  @type.update
  # redirect to "/types/#{params['id']}"
  redirect to "/types"
end

post '/types/:id/delete' do
  Type.delete(params['id'])
  redirect to '/types'
end
