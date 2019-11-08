# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all



Cocktail.create(name: "Henderson")
Cocktail.create(name: "Vodka Martini")
Cocktail.create(name: "Kir Royal")
Cocktail.create(name: "Negroni")



# w = Cocktail.create(name: "Whiskey Sour")

# d = Dose.new(description: "Mix all ingredients together")
# i = Ingredient.create(name: "Gin")

# d.cocktail = w
# d.ingredient = i
# d.save!


# Ingredient.create(name: "Tonic")
# Ingredient.create(name: "Cucumber")

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

user["drinks"].each do |i|
  ingredient = Ingredient.new
  ingredient[:name] = i["strIngredient1"]
  ingredient.save!
end

