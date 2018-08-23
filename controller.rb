require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/transaction")
also_reload("./models/*")


# HOME
get '/' do
  erb(:home)
end

# INDEX
get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end
