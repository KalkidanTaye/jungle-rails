require 'rails_helper'
RSpec.describe Product, type: :model do
    describe 'Validations' do
      # validation tests/examples here
      it "a product with all four fields set will save successfully" do
        @category = Category.new
        @product = Product.new
        @product.name = 'chair'
        @product.description = 'A comfortable chair'
        @product.image ='' 
        @product.price_cents = 300
        @product.quantity = 6
        @product.category = @category
        expect(@product.valid?). to be true
    end
  it "should not create when name is empty" do
        @category = Category.new
        @product = Product.new
        @product.name = nil
        @product.description = 'A comfortable chair'
        @product.image ='' 
        @product.price_cents = 300
        @product.quantity = 6
        @product.category = @category

        @product.valid?
        expect(@product.errors[:name]).to include("can't be blank")
    end
    it "should not create when price is empty" do
      @category = Category.new
      @product = Product.new
      @product.name = 'chair'
      @product.description = 'A comfortable chair'
      @product.image ='' 
      @product.price_cents = nil
      @product.quantity = 6
      @product.category = @category

      @product.valid?
      expect(@product.errors[:price]).to include("can't be blank")
  end

  it "should not create when quantity is empty" do
    @category = Category.new
    @product = Product.new
    @product.name = 'chair'
    @product.description = 'A comfortable chair'
    @product.image ='' 
    @product.price_cents = 300
    @product.quantity = nil
    @product.category = @category

    @product.valid?
    expect(@product.errors[:quantity]).to include("can't be blank")
end
it "should not create when category is empty" do
  @category = Category.new
  @product = Product.new
  @product.name = 'chair'
  @product.description = 'A comfortable chair'
  @product.image ='' 
  @product.price_cents = 300
  @product.quantity = 6
  @product.category = nil

  @product.valid?
  expect(@product.errors[:category]).to include("can't be blank")
end

  end
end