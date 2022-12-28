# PRODUCT
Product.destroy_all
product1 = Product.create({:code=>"GR1", :name=>"Green Tea", :price => 3.11})
product2 = Product.create({:code=>"SR1", :name=>"Strawberries", :price => 5.00})
product3 = Product.create({:code=>"CF1", :name=>"Coffee", :price => 11.23})

puts "Total number of products: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("name")}"
puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
puts "Product3: #{product3.name} price: #{product3.price.round(2)}"

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"