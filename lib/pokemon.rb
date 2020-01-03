require "pry"
class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name: , type:, db:, hp: nil)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
        @hp = hp
    end 

    def self.save(name, type, db)
        sql = <<-SQL
        Insert into pokemon (name, type) values (?,?)
        SQL
        db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = <<-SQL
        select * 
        from pokemon 
        where id = ?
        SQL
        found_pokemon = db.execute(sql, id).flatten
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db, hp:found_pokemon[3])
    end 

    def alter_hp(new_hp, db)
        sql = <<-SQL
        Update pokemon set hp = ? where id = ? 
        SQL
        db.execute(sql, new_hp, self.id)
    end 


end