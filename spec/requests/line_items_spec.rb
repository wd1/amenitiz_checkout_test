require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  
  # context "Purchase Rule Test on User's action" do
  #   puts "Purchase Rule Test like customer UI"
  #   it "Buy CR1" do
  #     visit root_path
  #     click_button('Add Green Tea to cart')
  #     visit 'carts/1'
  #     puts "Buy GR1"
  #     puts "Expected: [GR1, GR1], Price: 3.11€"
  #     page.find('#subtotal').should have_content('3.11€')
  #   end

  #   it "Buy SR1,SR1,GR1,SR1" do
  #     visit root_path
  #     click_button('Add Green Tea to cart')
  #     click_button('Add Strawberries to cart')
  #     click_button('Add Strawberries to cart')
  #     click_button('Add Strawberries to cart')
  #     visit 'carts/1'
  #     puts "Buy SR1,SR1,GR1,SR1"
  #     puts "Expected: [SR1,SR1,GR1,SR1], Price: 16.61€"
  #     page.find('#subtotal').should have_content('16.61€')
  #   end

  #   it "Buy GR1,CF1,SR1,CF1,CF1" do
  #     visit root_path

  #     click_button('Add Green Tea to cart')
  #     click_button('Add Coffee to cart')
  #     click_button('Add Strawberries to cart')
  #     click_button('Add Coffee to cart')
  #     click_button('Add Coffee to cart')

  #     visit 'carts/1'
  #     puts "Buy GR1,CF1,SR1,CF1,CF1"
  #     puts "Expected: [GR1,CF1,SR1,CF1,CF1], Price: 30.57€"
  #     page.find('#subtotal').should have_content('30.57€')
  #   end
  # end

  context "Purchase Rule Test on Controller" do
    puts "Purchase Rule Test on Controller"

    it "Buy CR1" do
      chosen_product = Product.find(1)
      cart = Cart.create
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 1
      @line_item.order = nil

      # Save and redirect to cart show path
      @line_item.save!
      puts "Buy GR1"
      puts "Expected: [GR1, GR1], Price: 3.11€"
      expect(cart.sub_total).to eq(3.11)
    end

    it "Buy SR1,SR1,GR1,SR1" do
      chosen_product = Product.find(2)
      cart = Cart.create
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 3
      @line_item.order = nil
      @line_item.save!

      chosen_product = Product.find(1)
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 1
      @line_item.order = nil
      @line_item.save!
      puts "Buy SR1,SR1,GR1,SR1"
      puts "Expected: [SR1,SR1,GR1,SR1], Price: 16.61€"
      expect(cart.sub_total).to eq(16.61)
    end

    it "Buy GR1,CF1,SR1,CF1,CF1" do
      chosen_product = Product.find(1)
      cart = Cart.create
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 1
      @line_item.order = nil
      @line_item.save!

      chosen_product = Product.find(2)
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 1
      @line_item.order = nil
      @line_item.save!

      chosen_product = Product.find(3)
      @line_item = LineItem.new
      @line_item.cart = cart
      @line_item.product = chosen_product
      @line_item.quantity = 3
      @line_item.order = nil
      @line_item.save!

      puts "Buy GR1,CF1,SR1,CF1,CF1"
      puts "Expected: [GR1,CF1,SR1,CF1,CF1], Price: 30.57€"
      expect(cart.sub_total).to eq(30.57)
    end
  end
end
