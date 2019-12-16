require "pry"
class Pokemon
  attr_accessor :name, :type, :db ,:id 
  def initialize(id:, name:, type:, hp: nil , db:)
    @id,
    @name,
    @type,
    @hp,
    @db = id, name, type, hp, db
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon(name,type) values (?,?)",name,type)
  end
  def self.find(id,db)
    
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1",id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    
  end
end
