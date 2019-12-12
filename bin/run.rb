require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

#Pokemon.new(name: "Dragon", type: "fire", db: @db)
#Pokemon.find(1)
# test out your code here!
