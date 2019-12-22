class Pokemon
     attr_accessor:name,:type,:db,:id
    
    def initialize(hash={})
      #binding.pry
      @id = id
      @name = name 
      @type = type
      @db = db
      
    end
    def self.save(name,type,db)
       sql = <<-SQL 
       INSERT INTO pokemon 
       (name,type) VALUES (?,?) 
       SQL
       db.execute(sql,name,type)
       
    end
      def self.find(id,db) 
        # binding.pry
        sql = <<-SQL 
       SELECT * FROM pokemon
       WHERE id = ?
       SQL
        last = db.execute(sql,id)
         new_obj = Pokemon.new
         #binding.pry
         new_obj.id = last[0][0]
         new_obj.name = last[0][1]
         new_obj.type = last[0][2]
         new_obj
         #binding.pry
      end
      
end
