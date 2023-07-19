class Passenger 
  attr_reader :name, :age, :driver

  def initialize(attributes)
    @name = attributes["name"]
    @age = attributes["age"]
    @driver = false
  end

  def adult? 
    if @age >= 18
      return true
    else
      return false
    end
  end

  def drive
    @driver = true
  end

  def driver? 
    if @driver == true
      return true

    else 
      return false
    end
  end
end