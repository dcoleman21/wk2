require 'rails_helper'

RSpec.describe "Ingredients Index Page" do 
  describe "lists all ingredients" do 
    it 'can list all ingredients names and costs' do
      avocado = Ingredient.create!(name: "Avocado", cost: 5)
      bread = Ingredient.create!(name: "Whole Grain", cost: 4)
      garlic_salt = Ingredient.create!(name: "Garlic Salt", cost: 2)

      visit "/ingredients"

      expect(page).to have_content("Ingredients List")
      expect(page).to have_content("Avocado: 5")
      expect(page).to have_content("Whole Grain: 4")
      expect(page).to have_content("Garlic Salt: 2")
    end
  end

  describe "extension 1" do 
    it "can see a list of ingredients sorted alphabetically by name" do 
      avocado = Ingredient.create!(name: "Avocado", cost: 5)
      bread = Ingredient.create!(name: "Whole Grain", cost: 4)
      garlic_salt = Ingredient.create!(name: "Garlic Salt", cost: 2)

      visit "/ingredients"

      expect(avocado.name).to appear_before(garlic_salt.name)
      expect(garlic_salt.name).to appear_before(bread.name)
    end
  end
end