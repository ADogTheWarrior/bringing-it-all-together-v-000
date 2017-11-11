class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    @id = nil
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.new_by_row(row)
    dog = Dog.new
    dog.id = row[0]
    dog.name = row[1]
    dog.breed = row[2]
    binding.pry
    dog
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
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
    self
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
    sql = "SELECT * FROM dogs WHERE name = ?"
    result = DB[:conn].execute(sql, name)[0]
    Dog.new_by_row(result)
    binding.pry
  end

  def update
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
end
