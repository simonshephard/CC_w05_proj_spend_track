require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")


Transaction.delete_all
Tag.delete_all
Merchant.delete_all


merchant1 = Merchant.new({"name" => "Merchant1"})
merchant2 = Merchant.new({"name" => "Merchant2"})
merchant1.save
merchant2.save

tag1 = Tag.new({"name" => "Tag1"})
tag2 = Tag.new({"name" => "Tag2"})
tag1.save
tag2.save

transaction1 = Transaction.new({
  "amount" => "10.50",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
})
transaction2 = Transaction.new({
  "amount" => "12.99",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
})
transaction1.save
transaction2.save


binding.pry
nil
