require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/type')
also_reload('./models/*')

get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @types = Type.all
  erb(:"merchants/new")
end

post '/merchants' do
  Merchant.new(params).save
  redirect to '/merchants'
end

get '/merchants/:id/edit' do
  @merchant= Merchant.find(params['id'])
  erb(:"merchants/edit")
end

post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update
  redirect to "/merchant/#{params['id']}"
end

post '/merchants/:id/delete' do
  Merchant.delete(params['id'])
  redirect to '/transactions'
end
