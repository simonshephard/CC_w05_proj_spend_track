require_relative("../db/sql_runner")
require_relative("./transaction")

class Budget

  attr_reader :id, :amount, :warning

  def initialize(options)
    @id = options["id"].to_i
    @amount = options["amount"]
    @warning = options["warning"]
  end

  def save
    sql = "INSERT INTO budgets
    (amount, warning)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@amount, @warning]
    data = SqlRunner.run(sql, values)
    @id = data.first["id"].to_i
  end

  def update
    sql = "UPDATE budgets
    SET
    (amount, warning)
    = ($1, $2)
    WHERE id = $3"
    values = [@amount, @warning, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM budgets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM budgets"
    data = SqlRunner.run(sql)
    data.map {|budget| Budget.new(budget)}
  end

  def self.delete_all
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets
    WHERE id = $1"
    values = [id]
    data = SqlRunner.run(sql, values)
    Budget.new(data.first)
  end

  def self.money_amount(amount_str)
    sprintf("%#.2f", amount_str)
  end

  def capacity
    transactions = Transaction.all
    total = Transaction.total(transactions)
    Budget.money_amount((@amount.to_f - total.to_f).to_s)
  end


end
