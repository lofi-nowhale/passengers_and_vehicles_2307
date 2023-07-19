require 'rspec'
require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do 
  it 'exists' do
    park = Park.new("RMNP", 10)

    expect(park).to be_a(Park)
  end

  it 'has readable attributes' do
    park = Park.new("RMNP", 10)

    expect(park.name).to be_a(String)
    expect(park.admission_price).to be_an(Integer)
    expect(park.vehicles).to be_an(Array)
    expect(park.vehicles).to all be_a(Vehicle)
    expect(park.passengers).to be_an(Array)
    expect(park.passengers).to all be_a(Passenger)
    expect(park.revenue).to be_an(Integer)
  end

  it 'can produce a list of all vehicles that have entered the park' do
    park = Park.new("RMNP", 10)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2012", "Chevrolet", "Cruz")
    vehicle_3 = Vehicle.new("2019", "Chevrolet", "Bolt")

    expect(park.vehicles).to eq([])

    park.add_vehicle(vehicle_1)
    park.add_vehicle(vehicle_2)
    park.add_vehicle(vehicle_3)

    expect(park.vehicles).to eq([vehicle_1,vehicle_2, vehicle_3])
  end

  it 'can provide a list of all passengers who were in vehicles that entered the park' do 
    park = Park.new("RMNP", 10)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2012", "Chevrolet", "Cruz")
    vehicle_3 = Vehicle.new("2019", "Chevrolet", "Bolt")

    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle_1.add_passenger(charlie)
    vehicle_2.add_passenger(jude)
    vehicle_3.add_passenger(taylor)

    expect(vehicle_1.passengers).to eq([charlie])
    expect(vehicle_2.passengers).to eq([jude])
    expect(vehicle_3.passengers).to eq([taylor])

    park.add_vehicle(vehicle_1)
    park.add_vehicle(vehicle_2)
    park.add_vehicle(vehicle_3)

    expect(park.vehicles).to eq([vehicle_1,vehicle_2, vehicle_3])

    park.add_passengers(vehicle_1)
    park.add_passengers(vehicle_2)
    park.add_passengers(vehicle_3)

    expect(park.passengers).to eq([[charlie],[jude], [taylor]]) 
  end

  it 'can collect revenue for each adult who has entered the park' do 
    park = Park.new("RMNP", 10)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2012", "Chevrolet", "Cruz")
    vehicle_3 = Vehicle.new("2019", "Chevrolet", "Bolt")

    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle_1.add_passenger(charlie)
    vehicle_2.add_passenger(jude)
    vehicle_3.add_passenger(taylor)

    expect(vehicle_1.passengers).to eq([charlie])
    expect(vehicle_2.passengers).to eq([jude])
    expect(vehicle_3.passengers).to eq([taylor])

    park.add_vehicle(vehicle_1)
    park.add_vehicle(vehicle_2)
    park.add_vehicle(vehicle_3)

    expect(park.vehicles).to eq([vehicle_1,vehicle_2, vehicle_3])

    park.add_passengers(vehicle_1)
    park.add_passengers(vehicle_2)
    park.add_passengers(vehicle_3)

    expect(park.revenue).to eq(20)
  end


end