class Park 
  attr_reader :name, :admission_price, :vehicles, :passengers, :revenue
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @passengers = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    
  end

  def add_passengers(vehicle)
    @passengers << vehicle.passengers
  end

  # def collect_fees
  #   adult_passengers = []
  #   @passengers.find_all do |passenger|
  #     if passenger.age >= 18 
  #       adult_passengers << passenger
  #     end
  #     @revenue += 10
  #   end
  #   revenue
  # end
end