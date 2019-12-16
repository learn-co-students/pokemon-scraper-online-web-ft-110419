require "pry"
class Pokemon
  attr_accessor :name, :type, :db ,:id 
  def initialize(id:, name:, type:,db:)
    @id
    @name
    @type
    @db
  end
  def self.save(name,type,db)
    sql = <<-SQL
     INSERT INTO pokemon(name,type) values (?,?)
    SQL
    db.execute(sql,name,type)
  end
  def self.find(id,db)
    
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1",id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    
  end
end
