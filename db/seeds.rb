require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts 'Cleaning database...'
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients_array = JSON.parse(open(url).read)['drinks']

puts 'Creating ingredients...'

ingredients = []
ingredients_array.each do |ingredient|
  ingredients << {
    name: ingredient["strIngredient1"]}
end

Ingredient.create!(ingredients)
puts 'Finished with ingredients'

puts 'Creating cocktails...'

cocktails = [
  {name: 'Mojito'},
  {name: 'Daiquiri'},
  {name: 'Cuba Libre'},
  {name: 'Gin Tonic'},
  {name: 'Sex on the Beach'}
]

Cocktail.create!(cocktails)

puts 'Finished with cocktails'

puts 'Creating doses...'

doses = [
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name: 'Mojito'),
    ingredient: Ingredient.find_by(name: 'Rum')
  },
  {
    description: '3cl',
    cocktail: Cocktail.find_by(name:'Mojito'),
    ingredient: Ingredient.find_by(name:'Lime juice')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Daiquiri'),
    ingredient: Ingredient.find_by(name:'Light rum')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Daiquiri'),
    ingredient: Ingredient.find_by(name:'Strawberries')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Cuba Libre'),
    ingredient: Ingredient.find_by(name:'Rum')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Cuba Libre'),
    ingredient: Ingredient.find_by(name:'Cocoa powder')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Gin Tonic'),
    ingredient: Ingredient.find_by(name:'Gin')
  },
  {
    description: '1cl',
    cocktail: Cocktail.find_by(name:'Sex on the Beach'),
    ingredient: Ingredient.find_by(name:'Vodka')
  },
  {
    description: '2cl',
    cocktail: Cocktail.find_by(name:'Sex on the Beach'),
    ingredient: Ingredient.find_by(name:'Cranberry juice')
  },
]

Dose.create!(doses)

puts 'Finished with doses'
