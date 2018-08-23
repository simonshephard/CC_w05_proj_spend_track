require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save
    sql = "INSERT INTO tags
    (name)
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    data = SqlRunner.run(sql, values)
    @id = data.first["id"].to_i
  end

  def update
    sql = "UPDATE tags
    SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM tags"
    data = SqlRunner.run(sql)
    data.map {|tag| Tag.new(tag)}
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    data = SqlRunner.run(sql, values)
    Tag.new(data.first)
  end

end
