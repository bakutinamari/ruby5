require_relative 'rail_road_manager'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

rail_road_manager = RailRoadManager.new
rail_road_manager.start

cargo_train_1 = CargoTrain.new("cargo_tr1")
cargo_train_2 = CargoTrain.new("cargo_tr2")
passenger_train_1 = PassengerTrain.new("passenger_tr1")
passenger_train_2 = PassengerTrain.new("passenger_tr2")

station = Station.new("station_1")
station.add_train(passenger_train_1)
station.add_train(passenger_train_2)
station.add_train(cargo_train_1)
station.add_train(cargo_train_2)

cargo_train_1.add_wagon(CargoWagon.new(45))

cargo_wagon_1 = CargoWagon.new(50)
cargo_wagon_1.add_volume(20)
cargo_wagon_1.add_volume(15)

cargo_train_1.add_wagon(cargo_wagon_1)
cargo_train_2.add_wagon(CargoWagon.new(55))

station.each_train
  do |train| 
    puts "Train :#{train.number},type :#{train.type},size #{train.wagons.size}"
  end
  
 train.each_wagon
   do |wagon|
     puts "Wagon's number :#{wagon.number},type :#{type.number},wagon cargo :#{free_volume}/#{take_volume},wagon passenger :#{free_seats}/#{take_seats}"
   end

