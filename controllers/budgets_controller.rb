require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/budget")
require_relative("../models/transaction")
also_reload("../models/*")


# INDEX
get "/budgets" do
  @budgets = Budget.all
  transactions = Transaction.all
  @total = Transaction.total(transactions)
  @analysis = Budget.analysis
  erb(:"budgets/index")
end

# NEW
get '/budgets/new' do
  erb(:"budgets/new")
end

# SHOW
get '/budgets/:id' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/show")
end

# CREATE
post '/budgets' do
  budget = Budget.new(params)
  budget.save
  redirect to '/budgets'
end

# EDIT
get '/budgets/:id/edit' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

# UPDATE
post '/budgets/:id' do
  budget = Budget.new(params)
  budget.update
  redirect to "/budgets"
end

# DELETE
post '/budgets/:id/delete' do
  budget = Budget.find(params[:id])
  budget.delete
  redirect to '/budgets'
end
