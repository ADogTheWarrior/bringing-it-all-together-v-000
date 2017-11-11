class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    # binding.pry
    @id = nil
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
    SQL

    DB[:conn].execute(sql)
  end
end
