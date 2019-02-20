# Display a menu in the console for the user to interact with.
def menu
  puts "Grocery Store:"
  puts "1) Add to Cart"
  puts "2) Remove from Cart"
  puts "3) View Cart"
  puts "4) Total Cost of Cart"
  puts "5) Add Item to Grocery Store"
  puts "6) Exit"
end





# Create a menu option to add items to a user's grocery cart.
def addcart
  puts "Select an item:"
  @store.each_with_index do |food, i|
    puts "#{i + 1}. #{food[:food]}"
  end
  additem = gets.to_i
  if @store.at(additem-1) != nil
  @cart << @store[additem-1]
  @store.delete_at(additem-1)
  puts "#{@cart.last[:food]} has been added to your cart"
  else
    puts "Please select a valid option"
    addcart
  end
end
# Create a menu option to display all the items in the cart.
def displaycart
  puts "Here are the items in your cart:"
  @cart.each_with_index do |food, i|
    puts "#{i + 1}. #{food[:food]}"
  end
end
# Create a menu option to remove an item from the users cart.
def removecart
  puts "Select an item:"
  @cart.each_with_index do |food, i|
    puts "#{i + 1}. #{food[:food]}"
  end
  additem = gets.to_i
  if @cart.at(additem-1) != nil
  @store << @cart[additem-1]
  @cart.delete_at(additem-1)
  puts "#{@store.last[:food]} has been removed to your cart"
  else
    puts "Please Select a Valid Option"
    removecart
  end
end
# Create a menu option to show the total cost of all the items in the user's cart.
# get values out of has in the @cart array by putting into new array
def cartcost
  @cartprice = []
  @cart.each do |food, i|
    @cartprice << food[:price].to_f
  end
  @sum = @cartprice.sum
  puts "The cart total is $#{@sum}"
end
# Add new items to the grocery store.
def addstore
  puts "Type the name of the item you would like to add:"
  newitem = gets.capitalize!.to_s
  puts "Type the price of the item:"
  newprice = gets.to_f
  puts "Is this correct:" 
  puts "Item: #{newitem}" 
  puts "Price: #{newprice}" 
  puts "Y/N"
  confirm = gets.to_s
  confirm_chomp = confirm.chomp
  if confirm_chomp == "y"
    @store << {:food => "#{newitem}", :price => "#{newprice}"}
  elsif confirm_chomp == "n"
    addstore
  else
    puts "Invalid Entry, Try Again"
    addstore
end
end



@cart = []


# Create a default array of hashes that represent items at a grocery store.
@store = [
  {food: "Milk", price: 2.59},
  {food: "Cereal", price: 4.29},
  {food: "Ground Beef", price: 7.99},
  {food: "Apples", price: 0.55},
  {food: "Peaches", price: 1.09}
]

while @input != 6
  menu
  @input = gets.to_i
  if @input == 1
    addcart
  elsif @input == 2
    removecart
  elsif @input == 3
    displaycart
  elsif @input == 4
    cartcost
  elsif @input == 5
    addstore
  elsif @input == 6
    puts "Goodbye"
  else
    puts "Please enter a valid option"
  end
end


# Zip it up and turn it in!
