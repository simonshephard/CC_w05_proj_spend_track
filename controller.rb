require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/transaction")
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
