# 0. Helper functions
# ------------------------

def print_divider
  puts "*" * 40
  puts "\n"
end

def print_progress_bar
  3.times { sleep 0.5; print "." }
  puts "\n"
end

# 1. Defining `shopping_cart`, `departments`, `products`
# ------------------------

@shopping_cart = []
@departments = [ :mats, :props, :clothes, :books ]

@products = {
  mats: [
    { reference_number: 1231, name: "Mat 1", price: 10 },
    { reference_number: 1232, name: "Mat 2", price: 20 },
  ],
  props: [
    { reference_number: 1233, name: "Block", price: 30 },
    { reference_number: 1234, name: "Meditation cushion", price: 30 },
  ],
  clothes: [
    { reference_number: 1235, name: "The best T-shirt", price: 200 },
    { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  ],
  books: [
    { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
    { reference_number: 1238, name: "Light On Yoga", price: 10 },
  ]
}

# 2. Defining store's methods
# ------------------------

def select_department
  puts "Check out our different departments:"

  @departments.each_with_index do |department, index|
    puts (index + 1).to_s + ") #{department}"
  end

  print_divider
  puts "Please select one department by its number: (1-#{@departments.length})"
  gets.chomp.to_i - 1
end

def show_products(department_index)
  print_divider

  department = @departments[department_index]
  products = @products[department]

  puts "These are the products under the #{department.to_s.upcase} department:"
  products.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    print_divider
  end

  products
end

def select_product
  puts "Select any item to by its reference_number:"
  gets.chomp.to_i
end

def add_product_to_cart(products, reference_number)
  product = look_up_product(products, reference_number)
  if product != nil
    @shopping_cart << product
    puts "Congratulations. '#{product[:name]}' has been added to the cart!"
  else
    puts "I don't think you selected a valid reference_number. Try again."
    print_divider
  end
end

def look_up_product(products, reference_number)
  products.each do |product|
    if product[:reference_number] == reference_number.to_i
      return product
    end
  end
end

def print_cart
  print_divider
  puts "CURRENT SHOPPING CART"
  print_divider

  total_price = 0

  @shopping_cart.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    print_divider

    total_price += product[:price]
  end

  puts "Total price: #{total_price} EUR"

  @shopping_cart
end

def ask_if_continue_shopping
  puts "Do you want to continue shopping?"
  answer = gets.chomp

  answer.upcase == 'Y'
end

# 3. Visiting the Store
# ------------------------

loop do
  puts "Welcome to the Yoga Shop!"
  department_index = select_department
  products = show_products(department_index)
  product_reference_number = select_product
  add_product_to_cart(products, product_reference_number)
  print_cart

  continue_shopping = ask_if_continue_shopping
  break unless continue_shopping
end

# 4. Leaving the Store
# ------------------------

print_divider
puts "Thank you very much for your visit. Enjoy your products!"
