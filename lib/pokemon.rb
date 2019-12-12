class Pokemon
	attr_accessor :id, :name, :type, :db
	# def initiaize(pokemon_hash)
	# 	pokemon_hash.each do |attr, value|
	# 		self.send("#{attr}=", value)
	# 	end
	# end 

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, database)
		sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
		database.execute(sql, name, type)
	end 

	def self.find(id, db = @db)
		sql_find = "SELECT name, type FROM pokemon WHERE id = ?"
		found = db.execute(sql_find, id).flatten
		Pokemon.new(id: id, name: found[0], type: found[1], db: db)
	end
end
