require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
# bundle exec ruby exercises/exercise_7.rb
### Exercise 7: Validations for both models

# 1. Add validations to two models to enforce the following business rules:

# - Employees must always have a first name present
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
end
# - Employees must always have a last name present
class Employee < ActiveRecord::Base
  validates :last_name, presence: true
end
# - Employees have a hourly_rate that is a number (integer) between 40 and 200
class Employee < ActiveRecord::Base
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end



# - Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
class Employee < ActiveRecord::Base
  validates :store_id, presence: true
end
# - Stores must always have a name that is a minimum of 3 characters

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
end
# - Stores have an annual_revenue that is a number (integer) that must be 0 or more
class Store < ActiveRecord::Base
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
# - BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)
class Store < ActiveRecord::Base
  validate :must_carry_apparel

  def must_carry_apparel
    if !mens_apparel
      errors.add(:mens_apparel, "Store must carry at least one type of apparel (men's or women's)")
    end
    if !womens_apparel
      errors.add(:womens_apparel, "Store must carry at least one type of apparel (men's or women's)")
    end
  end
end
# 2. Ask the user for a store name (store it in a variable)
puts "Store name?"
store_name = gets.chomp

puts "You entered: #{store_name}"
# 3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
# Store.create(
#   name: store_name,
# )

store = Store.new(name: store_name)
store.save
# 4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
puts store.errors.full_messages 


# employee = Employee.new
# employee.valid?  
# puts employee.errors.full_messages 