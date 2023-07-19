class Vehicle
  attr_reader :year, :make, :model, :passengers
  def initialize(year, make, model)
    @year = year
    @make = make 
    @model = model
    @speeding = false
    @passengers = []
  end

  def speed
    @speeding = true
  end

  def speeding?
    if @speeding == true
      return true
    else
      return false
    end
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    adult_passengers = []
    @passengers.find_all do |passenger|
      if passenger.age >= 18
        adult_passengers << passenger
      end
    end
    adult_passengers.count
  end
end