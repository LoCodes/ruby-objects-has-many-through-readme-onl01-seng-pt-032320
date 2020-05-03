# Customer
#   #new
#     initializes with a name and age
#   .all
#     is class method that returns the contents of @@all


class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

# Object relationships
  # Customer
  #   #new_meal
  #     initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # #meals
  #   returns an Array of Meal instances associated with this customer

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  # #waiters
  #   returns an Array of Waiter instances associated with this customer's meals

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end



end
