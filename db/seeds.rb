# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
avocado_toast = Recipe.create!(name: "Avocado Toast", complexity: 2, genre: "Light Eats")
butter = Ingredient.create!(name: "Irish Gold", cost: 3)

avocado = avocado_toast.ingredients.create!(name: "Avocado", cost: 5)
bread = avocado_toast.ingredients.create!(name: "Whole Grain", cost: 4)
garlic_salt = avocado_toast.ingredients.create!(name: "Garlic Salt", cost: 2)

