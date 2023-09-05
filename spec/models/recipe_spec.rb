require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "instance methods" do 
    it "can calculate a recipes total ingredient cost" do 
      avocado_toast = Recipe.create(name: "Avocado Toast", complexity: 2, genre: "Light Eats")

      avocado = avocado_toast.ingredients.create(name: "Avocado", cost: 5)
      bread = avocado_toast.ingredients.create(name: "Whole Grain", cost: 4)
      garlic_salt = avocado_toast.ingredients.create(name: "Garlic Salt", cost: 2)

      expect(avocado_toast.total_cost).to eq(11)
    end
  end
end