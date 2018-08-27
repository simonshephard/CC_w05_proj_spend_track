require_relative("../db/sql_runner")

class Transaction

  attr_reader :id, :date_time, :amount, :description, :merchant_id, :tag_id

  def initialize(options)
    @id = options["id"].to_i
    @date_time = options["date_time"]
    @amount = options["amount"].to_f
    @description = options["description"]
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end

  def save
    sql = "INSERT INTO transactions
    (date_time, amount, description, merchant_id, tag_id)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING *"
    values = [@date_time, @amount, @description, @merchant_id, @tag_id]
    data = SqlRunner.run(sql, values)
    @id = data.first["id"].to_i
  end

  def update
    sql = "UPDATE transactions
    SET
    (amount, description, merchant_id, tag_id)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@date_time, @amount, @description, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM transactions"
    data = SqlRunner.run(sql)
    data.map {|transaction| Transaction.new(transaction)}
  end

  def self.sort_time
    Transaction.all.sort_by{|transaction| transaction.date_time}
  end

  def self.filter(params)
    transactions = Transaction.all
    transactions = transactions.select {|transaction| transaction.date_time >= params["start_date_time"]} if params["start_date_time"]
    transactions = transactions.select {|transaction| transaction.date_time <= params["end_date_time"]} if params["end_date_time"]
    transactions = transactions.select {|transaction| transaction.amount >= params["min_amount"].to_f} if params["min_amount"]
    transactions = transactions.select {|transaction| transaction.amount <= params["max_amount"].to_f} if params["max_amount"]
    transactions = transactions.select {|transaction| transaction.merchant_id == params["merchant_id"].to_i} if params["merchant_id"].to_i > -1
    transactions = transactions.select {|transaction| transaction.tag_id == params["tag_id"].to_i} if params["tag_id"].to_i > -1
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    data = SqlRunner.run(sql, values)
    Transaction.new(data.first)
  end

  def self.total
    sql = "SELECT SUM(amount) FROM transactions"
    data = SqlRunner.run(sql)
    data.first["sum"]
  end

  def merchant
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    data = SqlRunner.run(sql, values)
    Merchant.new(data.first)
  end

  def tag
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    data = SqlRunner.run(sql, values)
    Tag.new(data.first)
  end

end
