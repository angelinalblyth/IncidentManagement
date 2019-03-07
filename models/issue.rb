require_relative( '../db/sql_runner' )

class Issue

  attr_reader :id
  attr_accessor :user_id, :date, :time, :incidentType, :description

  def initialize(options)
    @id = options['id'].to_i
    @user_id = options['user_id']
    @date = options['date']
    @time = options ['time']
    @incidentType = options['incidentType']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO issues (user_id, date, time, incidentType, description) VALUES($1, $2, $3, $4, $5) RETURNING *"
    values = [@user_id, @date, @time, @incidentType, @description]
    issue_data = SqlRunner.run(sql, values)
    @id = issue_data.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM issues where id = $1"
    values = [id]
    issue  = SqlRunner.run(sql, values)
    result = Issue.new(issue.first)
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM issues where id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM issues;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM issues;"
    issues = SqlRunner.run(sql)
    result = issues.map{|issue| Issue.new(issue)}
    return result
  end

  def user()
    user = User.find(@user_id)
    return user
  end

  def update()
     sql = "UPDATE issues SET (user_id, date, time, incidentType, description) = ($1, $2, $3, $4, $5) WHERE id = $6"
     values = [@user_id, @date, @time, @incidentType, @description, @id]
     SqlRunner.run(sql, values)
   end

end
