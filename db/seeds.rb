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

tag0 = Tag.new({"name" => "Other"})
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

merchant0 = Merchant.new({"name" => "Other"})
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
transaction3 = Transaction.new({"date_time" => "2018-08-01T09:36", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction4 = Transaction.new({"date_time" => "2018-01-25T17:04", "amount" => "119.95", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag0.id})
transaction5 = Transaction.new({"date_time" => "2018-05-02T12:30", "amount" => "100.00", "description" => "Table", "merchant_id" => merchant6.id, "tag_id" => tag6.id})
transaction6 = Transaction.new({"date_time" => "2017-11-19T23:50", "amount" => "125.57", "description" => "Flight", "merchant_id" => merchant4.id, "tag_id" => tag5.id})
transaction7 = Transaction.new({"date_time" => "2017-08-13T19:45", "amount" => "19.16", "description" => "Food", "merchant_id" => merchant3.id, "tag_id" => tag4.id})
transaction8 = Transaction.new({"date_time" => "2018-02-08T06:05", "amount" => "34.97", "description" => "Petrol", "merchant_id" => merchant1.id, "tag_id" => tag2.id})
transaction9 = Transaction.new({"date_time" => "2018-03-31T08:23", "amount" => "73.22", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag0.id})
transaction10 = Transaction.new({"date_time" => "2018-05-27T10:58", "amount" => "39.34", "description" => "Cinema", "merchant_id" => merchant3.id, "tag_id" => tag1.id})
transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save


binding.pry
nil
