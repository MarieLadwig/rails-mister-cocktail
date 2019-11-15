require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts 'Cleaning database...'
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients_array = JSON.parse(open(url).read)['drinks']

puts 'Creating ingredients...'

ingredients = [
  { name: 'Mint' },
  { name: 'Rasberries' },
  { name: 'Basil' },
  { name: 'Cucumber' },
  { name: 'Tonic' }
]
ingredients_array.each do |ingredient|
  ingredients << {
    name: ingredient["strIngredient1"]}
end

Ingredient.create!(ingredients)
puts 'Finished with ingredients'

puts 'Creating cocktails...'

  mojito = Cocktail.new(name: 'Mojito')
  mojito.remote_photo_url = 'http://wallsdesk.com/wp-content/uploads/2017/01/Mojito-Wallpapers.jpg'
  mojito.save

  daiquiri = Cocktail.new(name: 'Daiquiri')
  daiquiri.remote_photo_url = 'https://us.emedemujer.com/wp-content/uploads/sites/3/2018/07/iStock-691972236.jpg'
  daiquiri.save

  cuba = Cocktail.new(name: 'Cuba Libre')
  cuba.remote_photo_url = 'https://images.unsplash.com/photo-1447943549184-13f89172bcd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
  cuba.save

  gin_tonic = Cocktail.new(name: 'Gin Tonic')
  gin_tonic.remote_photo_url = 'https://images.unsplash.com/photo-1473348229220-66f5e48021f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
  gin_tonic.save

  sex_on_the_beach = Cocktail.new(name: 'Sex on the Beach')
  sex_on_the_beach.remote_photo_url = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsouthbaybeachclub.com%2Fwp-content%2Fuploads%2F2016%2F10%2FFotolia_64915564_S.jpg&f=1&nofb=1'
  sex_on_the_beach.save

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
