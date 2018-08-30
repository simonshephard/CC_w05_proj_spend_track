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

tag1 = Tag.new({"name" => "Food"})
tag2 = Tag.new({"name" => "House"})
tag3 = Tag.new({"name" => "Clothes"})
tag4 = Tag.new({"name" => "Travel"})
tag5 = Tag.new({"name" => "Entertainment"})
tag6 = Tag.new({"name" => "Car"})
tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save

merchant1 = Merchant.new({"name" => "Asda"})
merchant2 = Merchant.new({"name" => "Sainsburys"})
merchant3 = Merchant.new({"name" => "Tesco"})
merchant4 = Merchant.new({"name" => "Aldi"})
merchant5 = Merchant.new({"name" => "Lothian Buses"})
merchant6 = Merchant.new({"name" => "IKEA"})
merchant7 = Merchant.new({"name" => "Odeon"})
merchant8 = Merchant.new({"name" => "BA"})
merchant9 = Merchant.new({"name" => "Edinburgh Garage"})
merchant10 = Merchant.new({"name" => "Edinburgh Properties"})
merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save
merchant7.save
merchant8.save
merchant9.save
merchant10.save

transaction8 = Transaction.new({"date_time" => "2018-01-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction9 = Transaction.new({"date_time" => "2018-08-01T09:31", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction54 = Transaction.new({"date_time" => "2017-12-17T12:09", "amount" => "105.45", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction43 = Transaction.new({"date_time" => "2017-10-01T09:21", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction44 = Transaction.new({"date_time" => "2017-09-01T08:56", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction52 = Transaction.new({"date_time" => "2017-10-03T21:25", "amount" => "80.42", "description" => "Food", "merchant_id" => merchant3.id, "tag_id" => tag1.id})
transaction56 = Transaction.new({"date_time" => "2018-02-03T17:01", "amount" => "62.05", "description" => "Food", "merchant_id" => merchant3.id, "tag_id" => tag1.id})
transaction1 = Transaction.new({"date_time" => "2018-02-08T06:05", "amount" => "57.49", "description" => "Petrol", "merchant_id" => merchant3.id, "tag_id" => tag4.id})
transaction55 = Transaction.new({"date_time" => "2018-01-22T17:53", "amount" => "134.54", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction45 = Transaction.new({"date_time" => "2017-08-01T09:05", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction53 = Transaction.new({"date_time" => "2017-11-10T09:46", "amount" => "118.25", "description" => "Food", "merchant_id" => merchant4.id, "tag_id" => tag1.id})
transaction7 = Transaction.new({"date_time" => "2018-02-08T06:05", "amount" => "30.00", "description" => "MOT", "merchant_id" => merchant9.id, "tag_id" => tag6.id})
transaction57 = Transaction.new({"date_time" => "2018-03-19T18:32", "amount" => "78.20", "description" => "Food", "merchant_id" => merchant4.id, "tag_id" => tag1.id})
transaction34 = Transaction.new({"date_time" => "2018-05-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction50 = Transaction.new({"date_time" => "2017-08-18T09:04", "amount" => "32.27", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction31 = Transaction.new({"date_time" => "2017-09-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction10 = Transaction.new({"date_time" => "2018-07-25T09:36", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction46 = Transaction.new({"date_time" => "2018-03-01T08:42", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction23 = Transaction.new({"date_time" => "2018-03-31T08:23", "amount" => "73.22", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction35 = Transaction.new({"date_time" => "2018-06-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction51 = Transaction.new({"date_time" => "2017-09-25T15:13", "amount" => "87.23", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction5 = Transaction.new({"date_time" => "2018-07-01T11:30", "amount" => "12.99", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction24 = Transaction.new({"date_time" => "2018-06-01T10:30", "amount" => "10.50", "description" => "Food", "merchant_id" => merchant2.id, "tag_id" => tag1.id})
transaction15 = Transaction.new({"date_time" => "2018-08-05T08:39", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction16 = Transaction.new({"date_time" => "2018-03-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction17 = Transaction.new({"date_time" => "2018-02-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction18 = Transaction.new({"date_time" => "2018-08-05T17:33", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction19 = Transaction.new({"date_time" => "2018-02-08T06:05", "amount" => "34.97", "description" => "Petrol", "merchant_id" => merchant2.id, "tag_id" => tag4.id})
transaction20 = Transaction.new({"date_time" => "2018-08-02T08:46", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction21 = Transaction.new({"date_time" => "2017-11-19T23:50", "amount" => "125.57", "description" => "Flight", "merchant_id" => merchant8.id, "tag_id" => tag4.id})
transaction25 = Transaction.new({"date_time" => "2018-04-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction58 = Transaction.new({"date_time" => "2018-04-01T18:17", "amount" => "122.83", "description" => "Food", "merchant_id" => merchant1.id, "tag_id" => tag1.id})
transaction30 = Transaction.new({"date_time" => "2017-08-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction41 = Transaction.new({"date_time" => "2017-09-01T09:15", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction33 = Transaction.new({"date_time" => "2017-11-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction13 = Transaction.new({"date_time" => "2018-05-28T09:30", "amount" => "100.00", "description" => "Table", "merchant_id" => merchant6.id, "tag_id" => tag2.id})
transaction40 = Transaction.new({"date_time" => "2017-10-01T08:34", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction42 = Transaction.new({"date_time" => "2017-08-01T08:48", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction12 = Transaction.new({"date_time" => "2018-08-03T09:36", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction47 = Transaction.new({"date_time" => "2018-02-01T09:20", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction11 = Transaction.new({"date_time" => "2017-12-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction3 = Transaction.new({"date_time" => "2017-09-15T20:05", "amount" => "15.00", "description" => "Cinema", "merchant_id" => merchant7.id, "tag_id" => tag5.id})
transaction4 = Transaction.new({"date_time" => "2018-01-25T17:04", "amount" => "97.57", "description" => "Food", "merchant_id" => merchant3.id, "tag_id" => tag1.id})
transaction36 = Transaction.new({"date_time" => "2018-07-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction2 = Transaction.new({"date_time" => "2018-06-05T11:30", "amount" => "42.50", "description" => "Chair", "merchant_id" => merchant6.id, "tag_id" => tag2.id})
transaction32 = Transaction.new({"date_time" => "2017-10-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})
transaction6 = Transaction.new({"date_time" => "2018-02-08T06:05", "amount" => "26.92", "description" => "Petrol", "merchant_id" => merchant2.id, "tag_id" => tag4.id})
transaction14 = Transaction.new({"date_time" => "2018-08-04T09:17", "amount" => "1.70", "description" => "Bus", "merchant_id" => merchant5.id, "tag_id" => tag4.id})
transaction22 = Transaction.new({"date_time" => "2017-08-13T19:45", "amount" => "19.16", "description" => "Food", "merchant_id" => merchant4.id, "tag_id" => tag1.id})
transaction26 = Transaction.new({"date_time" => "2018-05-27T20:58", "amount" => "15.00", "description" => "Cinema", "merchant_id" => merchant7.id, "tag_id" => tag5.id})
transaction37 = Transaction.new({"date_time" => "2018-08-05T00:00", "amount" => "850.00", "description" => "Rent", "merchant_id" => merchant10.id, "tag_id" => tag2.id})


transaction18.save
transaction22.save
transaction23.save
transaction14.save
transaction50.save
transaction41.save
transaction42.save
transaction43.save
transaction44.save
transaction45.save
transaction46.save
transaction47.save
transaction2.save
transaction3.save
transaction4.save
transaction30.save
transaction51.save
transaction52.save
transaction17.save
transaction25.save
transaction31.save
transaction32.save
transaction33.save
transaction55.save
transaction34.save
transaction54.save
transaction21.save
transaction1.save
transaction35.save
transaction56.save
transaction53.save
transaction36.save
transaction24.save
transaction19.save
transaction16.save
transaction57.save
transaction20.save
transaction37.save
transaction40.save
transaction5.save
transaction58.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction15.save
transaction26.save
transaction10.save
transaction11.save
transaction13.save
transaction12.save


binding.pry
nil
