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
    str = sprintf("%#.2f", amount_str)
    str = str.reverse.gsub(/(\d{3})/,"\\1,").chomp(",").reverse
    str = (str.reverse.chomp("-").chomp(",") + "-").reverse if str[0] == "-"
    str
  end

  def capacity
    transactions = Transaction.all
    total = Transaction.total(transactions)
    Budget.money_amount((@amount.to_f - total.to_f).to_s)
  end

  def self.spending_by_month
    transactions = Transaction.all
    spending_by_month = {}
    transactions.each do |transaction|
      if spending_by_month.has_key?(transaction.year_month)
        spending_by_month[transaction.year_month] += transaction.amount.to_f
      else
        spending_by_month[transaction.year_month] = transaction.amount.to_f
      end
    end
    spending_by_month
  end

  def self.analysis
    spending = Budget.spending_by_month
    months = spending.keys.sort.reverse
    budget = Budget.all[0].amount
    budget_formatted = Budget.money_amount(budget)
    monthly_spend = []
    budget_repeat = []
    vs_budget = []
    chart_tobudget = []
    chart_overbudget = []
    for month in months
      monthly_spend << Budget.money_amount(spending[month].to_s)
      budget_repeat << budget_formatted
      vs_budget << Budget.money_amount((spending[month] - budget.to_f).to_s)
      units = (spending[month] / (Budget.all[0].amount.to_f / 20.0)).ceil
      if units > 20
        # chart_tobudget <<  "*" * 10
        # chart_overbudget <<  "*" * (units-10)
        chart_tobudget <<  "I" * 20
        chart_overbudget <<  "I" * (units-20)
      else
        # chart_tobudget << "*" * units
        # chart_overbudget << ""
        chart_tobudget << "I" * units
        chart_overbudget << ""
      end
    end

    result = []
    result << months
    result << monthly_spend
    result << budget_repeat
    result << vs_budget
    result << chart_tobudget
    result << chart_overbudget
    result
  end




end
