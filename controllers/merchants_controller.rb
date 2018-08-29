require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/merchant")
require_relative("../models/transaction")
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
  filter_params = {}
  filter_params[:start_date_time] = ""
  filter_params[:end_date_time] = ""
  filter_params[:min_amount] = ""
  filter_params[:max_amount] = ""
  filter_params[:merchant_id] = params[:id]
  # filter_params[:tag_id] # just do not set
  @transactions = Transaction.filter(filter_params)
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

# UPDATE
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants"
end

# DELETE
post '/merchants/:id/delete' do
  merchant = Merchant.find(params[:id])
  merchant.delete
  redirect to '/merchants'
end
