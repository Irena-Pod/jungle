require 'rails_helper'

RSpec.feature "Visitor can add product to cart and the cart count increases by one", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on 'Add to Cart' button, and My Cart(0) updates to My Cart(1)" do
    visit root_path
    save_screenshot 'test3a.png'
    click_button('Add', match: :first)
    expect(page).to have_text 'My Cart (1)'
    save_screenshot 'test3b.png'
  end

end
