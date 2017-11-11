class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    @id = nil
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs
    INTEGER PRIMARY KEY id
    TEXT name
    TEXT breed
    SQL

    DB[:conn].execute(sql)
  end
end
