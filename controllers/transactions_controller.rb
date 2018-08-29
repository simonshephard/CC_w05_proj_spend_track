require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/transaction")
require_relative("../models/tag")
require_relative("../models/merchant")
also_reload("../models/*")


# INDEX
get "/transactions" do
  @transactions = Transaction.all
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY ID
get "/transactions/sort_id" do
  @transactions = Transaction.sort_id
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY TIME
get "/transactions/sort_time" do
  @transactions = Transaction.sort_time
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY AMOUNT
get "/transactions/sort_amount" do
  @transactions = Transaction.sort_amount
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY DESCRIPTION
get "/transactions/sort_description" do
  @transactions = Transaction.sort_description
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY MERCHANT
get "/transactions/sort_merchant" do
  @transactions = Transaction.sort_merchant
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - SORT BY TAG
get "/transactions/sort_tag" do
  @transactions = Transaction.sort_tag
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# INDEX - FILTER FORM
get "/transactions/filter" do
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:"transactions/filter")
end

# INDEX - FILTERED
get "/transactions/filtered" do
  @transactions = Transaction.filter(params)
  @total = Transaction.total(@transactions)
  erb(:"transactions/index")
end

# NEW
get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:"transactions/new")
end

# SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# CREATE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end

# EDIT
get '/transactions/:id/edit' do
  @tags = Tag.all
  @merchants = Merchant.all
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

# UPDATE
post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{transaction.id}"
end

# DELETE
post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  redirect to '/transactions'
end
