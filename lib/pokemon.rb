class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id).flatten
    self.new(id: result[0], name: result[1], type: result[2], db: db)
  end
end
