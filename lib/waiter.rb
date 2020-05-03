# Waiter
#    #new
#      initializes with a name and years of experience
#    .all
#      is class method that returns the contents of @@all

class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience= yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

#Object relationships
# #new_meal
#   initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip

def new_meal(customer, total, tip=0)
  Meal.new(self, customer, total, tip)
end



  # #meals
  #  returns an Array of Meal instances associated with this waiter

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  # #best_tipper
  #  returns the Customer instance associated with the meal that received the largest tip

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end
end
