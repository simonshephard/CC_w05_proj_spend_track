require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/transaction")
require_relative("../models/tag")
require_relative("../models/merchant")
also_reload("../models/*")


# INDEX
get "/merchants" do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

# NEW
get '/merchants/new' do
  erb(:"merchants/new")
end

# SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/show")
end

# CREATE
post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save
  redirect to '/merchants'
end

# EDIT
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

# UPDATE
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants/#{merchant.id}"
end

# DELETE
post '/merchants/:id/delete' do
  merchant = Merchant.find(params[:id])
  merchant.delete
  redirect to '/merchants'
end
