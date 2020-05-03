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

  def new_meal(total, tip, customer)
    Meal.new
  end



  # #meals
  #  returns an Array of Meal instances associated with this waiter

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

end
