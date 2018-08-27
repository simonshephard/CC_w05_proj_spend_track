require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")


Transaction.delete_all
Tag.delete_all
Merchant.delete_all


merchant0 = Merchant.new({"name" => "OTHER"})
merchant1 = Merchant.new({"name" => "Asda"})
merchant2 = Merchant.new({"name" => "Sainsburys"})
merchant3 = Merchant.new({"name" => "Tesco"})
merchant4 = Merchant.new({"name" => "Aldi"})
merchant5 = Merchant.new({"name" => "Lothian Buses"})
merchant6 = Merchant.new({"name" => "IKEA"})
merchant0.save
merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save

tag0 = Tag.new({"name" => "OTHER"})
tag1 = Tag.new({"name" => "Food"})
tag2 = Tag.new({"name" => "Rent"})
tag3 = Tag.new({"name" => "Clothes"})
tag4 = Tag.new({"name" => "Travel"})
tag5 = Tag.new({"name" => "Entertainment"})
tag6 = Tag.new({"name" => "Car"})
tag0.save
tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save

transaction1 = Transaction.new({"amount" => "10.50", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction2 = Transaction.new({"amount" => "12.99", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction3 = Transaction.new({"amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction4 = Transaction.new({"amount" => "119.95", "description" => "Table", "merchant_id" => merchant6.id, "tag_id" => tag0.id})
transaction1.save
transaction2.save
transaction3.save
transaction4.save


binding.pry
nil
