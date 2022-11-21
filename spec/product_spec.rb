require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      category=Category.new(name: "Trees")
      expect(Product.new(name:"Eesrorn", price_cents: 3999, quantity: 20, category: category)).to be_valid
    end
    it "is invalid without the price" do
      category=Category.new(name: "Trees")
      product=Product.new(name:"Eesrorn", price_cents: nil, quantity: 20, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include ("Price can't be blank")
    end
    it "is invalid without product's quantity" do
      category=Category.new(name: "Trees")
      product=Product.new(name:"Eesrorn", price_cents: 3999, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it "is invalid without product's name" do
      category=Category.new(name: "Trees")
      product=Product.new(name:nil, price_cents: 3999, quantity: 20, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include ("Name can't be blank")
    end
    it "is invalid without product's category" do
      product=Product.new(name:"Eesrorn", price_cents: 3999, quantity: 20, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end