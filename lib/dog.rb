class Dog
  attr_accessor :name, :breed, :id

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}"=), value)}
  end

  def self.create_table
    SQL = <<-SQL
    CREATE TABLE dogs
    INTEGER PRIMARY KEY id
    TEXT name
    TEXT breed
    SQL
  end
end
