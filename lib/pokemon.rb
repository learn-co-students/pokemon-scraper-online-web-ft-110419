require 'pry'
class Pokemon
    attr_accessor :name, :type, :id, :db

    def  initialize(keys)
        @id = id
        @db = db
        @name = name 
        @type = type 
    end 

    def self.save(name, type, db)
        sql = <<-SQL 
            INSERT INTO pokemon(name, type)
            VALUES(?, ?);
        SQL
        db.execute(sql, name, type)
        @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
    end 

    def self.find(id, db)
        sql = <<-SQL 
            SELECT * 
            FROM pokemon
            WHERE id = ? 
        SQL
       poke = db.execute(sql, id)
       new_pokemon = self.new(poke)
        new_pokemon.id = poke[0][0]
        new_pokemon.name = poke[0][1]
        new_pokemon.type = poke[0][2]
        new_pokemon
    end 

end
