require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# bundle exec ruby exercises/exercise_2.rb
# Your code goes here ...

# ### Exercise 2: Update the first store

# 1. Load the first store (with `id = 1`) from the database and assign it to an instance variable `@store1`.
@store1 = Store.find_by(id: 1)
puts @store1.inspect

# 2. Load the second store from the database and assign it to `@store2`.
@store2 = Store.second
puts @store2.inspect
# 3. Update the first store (`@store1`) instance in the database. (Change its name or something.)

@store1.update(annual_revenue: 500000)
puts @store1.inspect