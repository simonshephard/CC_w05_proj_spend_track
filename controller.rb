require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/transaction")
require_relative("./models/tag")
require_relative("./models/merchant")
also_reload("./models/*")


# HOME
get "/" do
  erb(:home)
end

# INDEX
get "/transactions" do
  @transactions = Transaction.all
  erb(:index)
end

# NEW - above show to avoid conflict
get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:new)
end

# SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:show)
end
# what are standard REST for show / create

# CREATE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end

# EDIT
get '/transactions/:id/edit' do
  id = params[:id]
  @transaction = Transaction.find(id)
  erb(:edit)
end

# UPDATE
post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/pizza-orders/#{transaction.id}"
end

# DELETE
post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  redirect to '/transactions'
end
