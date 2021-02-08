require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "a product with all four fields saves successfully" do
      new_cat = Category.create()
      product = new_cat.products.create(
        name: "Desk",
        price: 300,
        quantity: 2
      )
      expect(product).to be_valid
      puts product.errors.full_messages
    end

    it "category can't be blank" do
      product = Product.create(
        name: "Desk",
        price: 300,
        quantity: 2
      )
      expect(product).not_to be_valid
      puts product.errors.full_messages
    end

    it "name can't be blank" do
      new_cat = Category.create()
      product = new_cat.products.create(
        name: nil,
        price: 300,
        quantity: 2
      )
      expect(product).not_to be_valid
      puts product.errors.full_messages
    end

    it "price can't be blank" do
      new_cat = Category.create()
      product = new_cat.products.create(
        name: "Desk",
        price: nil,
        quantity: 2
      )
      expect(product).not_to be_valid
      puts product.errors.full_messages
    end

    it "quantity can't be blank" do
      new_cat = Category.create()
      product = new_cat.products.create(
        name: "Desk",
        price: 300,
        quantity: nil
      )
      expect(product).not_to be_valid
      puts product.errors.full_messages
    end

  end
end
