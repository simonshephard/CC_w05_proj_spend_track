require_relative("../db/sql_runner")

class Budget

  attr_reader :id, :amount

  def initialize(options)
    @id = options["id"].to_i
    @amount = options["amount"].to_f
  end

  def save
    sql = "INSERT INTO budgets
    (amount)
    VALUES
    ($1)
    RETURNING *"
    values = [@amount]
    data = SqlRunner.run(sql, values)
    @id = data.first["id"].to_i
  end

  def update
    sql = "UPDATE budgets
    SET
    amount = $1
    WHERE id = $2"
    values = [@amount, @id]
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

end
