require_relative("../models/budget.rb")
require_relative("../models/tag.rb")
require_relative("../models/merchant.rb")
require_relative("../models/transaction.rb")
require("pry-byebug")


Transaction.delete_all
Merchant.delete_all
Tag.delete_all
Budget.delete_all


budget1 = Budget.new({"amount" => "1000.00", "warning" => "900.00"})
budget1.save

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

transaction1 = Transaction.new({"date_time" => "2018-06-01T10:30", "amount" => "10.50", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction2 = Transaction.new({"date_time" => "2018-07-01T11:30", "amount" => "12.99", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction3 = Transaction.new({"date_time" => "2018-08-01T09:30", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction4 = Transaction.new({"date_time" => "2018-08-02T17:30", "amount" => "119.95", "description" => "Table", "merchant_id" => merchant6.id, "tag_id" => tag0.id})
transaction1.save
transaction2.save
transaction3.save
transaction4.save


binding.pry
nil
