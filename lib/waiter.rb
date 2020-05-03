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

end
