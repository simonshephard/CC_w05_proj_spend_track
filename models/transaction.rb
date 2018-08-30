require_relative("../db/sql_runner")

class Transaction

  @@current_transactions = []

  attr_reader :id, :date_time, :amount, :description, :merchant_id, :tag_id

  def initialize(options)
    @id = options["id"].to_i
    @date_time = options["date_time"]
    @amount = options["amount"]
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

  def self.sort_id(transactions)
    sorted = transactions.sort_by{|transaction| transaction.id}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.sort_time(transactions)
    sorted = transactions.sort_by{|transaction| [transaction.date_time, transaction.id]}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.sort_amount(transactions)
    sorted = transactions.sort_by{|transaction| [transaction.amount.to_f, transaction.date_time, transaction.id]}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.sort_description(transactions)
    sorted = transactions.sort_by{|transaction| [transaction.description, transaction.date_time, transaction.id]}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.sort_merchant(transactions)
    sorted = transactions.sort_by{|transaction| [transaction.merchant.name, transaction.date_time, transaction.id]}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.sort_tag(transactions)
    sorted = transactions.sort_by{|transaction| [transaction.tag.name, transaction.date_time, transaction.id]}
    return sorted.reverse! if sorted == transactions
    sorted
  end

  def self.filter(params)
    transactions = Transaction.all
    transactions = transactions.select {|transaction| transaction.date_time >= params[:start_date_time]} if params[:start_date_time] != ""
    transactions = transactions.select {|transaction| transaction.date_time <= params[:end_date_time]} if params[:end_date_time] != ""
    transactions = transactions.select {|transaction| transaction.amount >= params[:min_amount].to_f} if params[:min_amount] != ""
    transactions = transactions.select {|transaction| transaction.amount <= params[:max_amount].to_f} if params[:max_amount] != ""
    transactions = transactions.select {|transaction| transaction.merchant_id == params[:merchant_id].to_i} if params.has_key?(:merchant_id)
    transactions = transactions.select {|transaction| transaction.tag_id == params[:tag_id].to_i} if params.has_key?(:tag_id)
    transactions
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

  def self.total(transactions)
    total = transactions.sum {|transaction| transaction.amount.to_f}
    total.to_s
  end

  def self.set_current(transactions)
    @@current_transactions = transactions
  end

  def self.get_current
    @@current_transactions
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

  def self.money_amount(amount_str)
    str = sprintf("%#.2f", amount_str)
    str = str.reverse.gsub(/(\d{3})/,"\\1,").chomp(",").reverse
    str = (str.reverse.chomp("-").chomp(",") + "-").reverse if str[0] == "-"
    str
  end

  def date_time_format
    date_time[0,10] + " " + date_time[11,5]
  end

  def year
    date_time[0,4]
  end

  def month
    date_time[5,2]
  end

  def year_month
    year + "-" + month
  end


end
