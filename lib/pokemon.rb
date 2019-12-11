class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(attributes)
    attributes.each { |key, value| self.send("#{key}=", value) }
  end
  
  def self.save(name, type, db)
    pokemon = self.new(name: name, type: type, db: db)
    
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL
    
    db.execute(sql, name, type)
    pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE pokemon.id = ?
      LIMIT 1
    SQL
    
    db.execute(sql, id).map do |row|
      self.new_from_db(row)
    end.first
  end
  
  def self.new_from_db(row)
    return self.new(id: row[0], name: row[1], type: row[2])
  end
  
end
