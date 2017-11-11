class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    @id = nil
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self
      # binding.pry
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

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end

  def save
  end

  def self.create(attributes)
  end

  def self.find_by_id(id)
  end

  def self.find_or_create_by(attributes)
  end

  def self.new_from_db(row) #[id, name, breed]
  end

  def self.find_by_name(name)
  end

  def update(id)
    binding.pry
  end
end
