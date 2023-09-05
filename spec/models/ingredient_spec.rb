require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do
      it "can sort ingredient names alphabetically" do 
         avocado = Ingredient.create!(name: "Avocado", cost: 5)
         bread = Ingredient.create!(name: "Whole Grain", cost: 4)
         garlic_salt = Ingredient.create!(name: "Garlic Salt", cost: 2)

         expect(Ingredient.sort_alphabetically).to eq([avocado, garlic_salt, bread])
      end
   end
end