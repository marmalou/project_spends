require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/type')
also_reload('./models/*')

get '/transactions' do
  @transactions = Transaction.all
  @transactions_total = Transaction.total_cost
  erb(:"transactions/index")
end

get '/transactions/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @types = Type.all
  erb(:"transactions/new")
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @types = Type.all
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update
  redirect to "/transactions/#{params['id']}"
end

post '/transactions/:id/delete' do
  Transaction.delete(params['id'])
  redirect to '/transactions'
end
