class Pokemon
    @@all = []

    def initialize (id:, name:, type:, db:)
      @id = "1"
      @name = "Pikachu"
      @type = "electric"
      @db = SQLite3::Database
      @@all << self
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL
        
        db.execute(sql, [name, type])
        
      end
    def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    pokemon_inst = Pokemon.new(id: id, name: name, type: type, hp: hp, db: database_connection)
  end



  
    
end
