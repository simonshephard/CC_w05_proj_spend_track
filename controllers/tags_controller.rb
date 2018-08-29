require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/tag")
also_reload("../models/*")


# INDEX
get "/tags" do
  @tags = Tag.all
  erb(:"tags/index")
end

# NEW
get '/tags/new' do
  erb(:"tags/new")
end

# SHOW
get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb(:"tags/show")
end

# CREATE
post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to '/tags'
end

# EDIT
get '/tags/:id/edit' do
  filter_params = {}
  filter_params[:start_date_time] = ""
  filter_params[:end_date_time] = ""
  filter_params[:min_amount] = ""
  filter_params[:max_amount] = ""
  filter_params[:merchant_id] # just do not set
  filter_params[:tag_id] = params[:id]
  @transactions = Transaction.filter(filter_params)
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

# UPDATE
post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags"
end

# DELETE
post '/tags/:id/delete' do
  tag = Tag.find(params[:id])
  tag.delete
  redirect to '/tags'
end
