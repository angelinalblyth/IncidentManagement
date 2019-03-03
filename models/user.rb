require_relative( '../db/sql_runner' )

class User

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO users(name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def issue()
    sql = "SELECT * from issues where user_id = $1"
    values = [@id]
    issues = SqlRunner.run(sql, values)
    result = issues.map {|issue| Issue.new(issue)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM users where id = $1"
    values = [id]
    user = SqlRunner.run(sql, values)
    result = User.new(user.first)
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM users where id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def self.all()
  sql = "SELECT * FROM users"
  results = SqlRunner.run(sql)
  return results.map { |user| User.new(user)}
  end

  def update()
    sql = "UPDATE users SET (name) = ($1)
      WHERE id = $1"
      values = [@name, @id]
      SqlRunner.run(sql, values)
  end

end
