require 'rails_helper'

RSpec.describe "Recipes show page" do 
  describe "recipes info" do 
    it "can see the recipes name, complexity and genre" do 
      avocado_toast = Recipe.create!(name: "Avocado Toast", complexity: 2, genre: "Light Eats")

      avocado = avocado_toast.ingredients.create(name: "Avocado", cost: 5)
      bread = avocado_toast.ingredients.create(name: "Whole Grain", cost: 4)
      garlic_salt = avocado_toast.ingredients.create(name: "Garlic Salt", cost: 2)

      visit "/recipes/#{avocado_toast.id}"

      expect(page).to have_content("Avocado Toast")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Light Eats")
    end

    it "can see a list of the ingredients names for the recipe" do 
      avocado_toast = Recipe.create(name: "Avocado Toast", complexity: 2, genre: "Light Eats")

      avocado = avocado_toast.ingredients.create(name: "Avocado", cost: 5)
      bread = avocado_toast.ingredients.create(name: "Whole Grain", cost: 4)
      garlic_salt = avocado_toast.ingredients.create(name: "Garlic Salt", cost: 2)

      recipes = Recipe.all

      recipes.each do |recipe|
        visit "/recipes/#{recipe.id}"
        expect(page).to have_content("Ingredients")
        recipe.ingredients.each do |ingredient|
          expect(page).to have_content(ingredient.name)
        end
      end
    end

    it "can see the total cost of all the ingredients in the recipe" do 
      avocado_toast = Recipe.create(name: "Avocado Toast", complexity: 2, genre: "Light Eats")

      avocado = avocado_toast.ingredients.create(name: "Avocado", cost: 5)
      bread = avocado_toast.ingredients.create(name: "Whole Grain", cost: 4)
      garlic_salt = avocado_toast.ingredients.create(name: "Garlic Salt", cost: 2)

      recipes = Recipe.all

      recipes.each do |recipe|
        visit "/recipes/#{recipe.id}"
        expect(page).to have_content("Total Cost: $#{recipe.total_cost}")
      end
    end
  end
  describe "Extension 2 - Add an Ingredient to a Recipe" do 
    it "can see a form to add an ingredient to the recipe" do 
      avocado_toast = Recipe.create(name: "Avocado Toast", complexity: 2, genre: "Light Eats")

      avocado = avocado_toast.ingredients.create(name: "Avocado", cost: 5)
      bread = avocado_toast.ingredients.create(name: "Whole Grain", cost: 4)
      garlic_salt = avocado_toast.ingredients.create(name: "Garlic Salt", cost: 2)

      butter = Ingredient.create(name: "Irish Gold", cost: 3)

      recipes = Recipe.all

      visit "recipes/#{avocado_toast.id}"

      expect(page).to have_content("Add ingredient to recipe")
      
      fill_in 'ingredient_id', with: butter.id
      click_on 'Add Ingredient'

      expect(current_path).to eq("/recipes/#{avocado_toast.id}")
      
      expect(page).to have_content("#{butter.name}")
    end
  end
end