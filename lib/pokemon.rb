class Pokemon
  attr_accessor :name,:type
  attr_reader :id, :db
  
  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.new_by_db(row)
    pokemon = self.new(id: row[0], name: row[1], type: row[2],db: @db)
    pokemon
  end
  
  def self.save(pk_name, pk_type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name,type) VALUES(?,?)
    SQL
    db.execute(sql,pk_name,pk_type)
  end
  
  def self.find(id_, db_)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon = db_.execute(sql,id_).map{|row| self.new_by_db(row) }
    pokemon.first
  end
end