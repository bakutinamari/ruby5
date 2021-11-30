require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class RailRoad
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = {}
    @trains = {}
    @routes = {}
  end

  def create_station(name)
    stations[name] = !stations.has_key?(name) ? Station.new(name) : stations[name]
  end

  def create_train(type, number)
    return trains[number] if trains.has_key?(number)

    train = type == 'c' ? PassengerTrain.new(number) : CargoTrain.new(number)
    trains[number] = train
  end

  def create_route(first_station_name, last_station_name)
    stored_route = get_route(first_station_name, last_station_name)
    return stored_route if stored_route

    routes[first_station_name] = {} unless routes[first_station_name]
    route = Route.new(stations[first_station_name], stations[last_station_name])
    routes[first_station_name][last_station_name] = route
  end

  def add_station_to_route(station_name, first_station_name, last_station_name)
    route = get_route(first_station_name, last_station_name)
    station = get_station(station_name)
    return if !route || !station

    route.add_station(station)
  end

  def  del_station_from_route(station_name, first_station_name, last_station_name)
    route = get_route(first_station_name, last_station_name)
    station = get_station(station_name)
    return if !route || !station

    route.del_station(station)
 end

  def add_route_to_train(first_station_name, last_station_name, train_number)
    route = get_route(first_station_name, last_station_name)
    train = get_train(train_number)
    return if !route || !train

    train.add_route(route)
    station = get_station(first_station_name)
    station.add_train(train)
  end

  def add_wagon_to_train(wagon, train_number)
    train = get_train(train_number)
    return unless train

    train.add_wagon(wagon)
  end

  def del_wagon_from_train(_wagon, train_number)
    train = get_train(train_number)
    return unless train

    train.del_wagon
  end

  def move_train_forward(train_number)
    train = get_train(train_number)
    return unless train

    train.move_forward
    prev_station = train.get_prev_station
    prev_station.del_train(train)
    current_station = train.get_current_station
    current_station.add_train(train)
  end

  def move_train_backward(train_number)
    train = get_train(train_number)
    return unless train

    train.move_backward
    next_station = train.get_next_station
    next_station.del_train(train)
    current_station = train.get_current_station
    current_station.add_train(train)
  end

  def get_stations
    stations.values
  end

  def get_station_trains(station_name)
    station = get_station(station_name)
    return station.trains if station
  end

   private

  def get_route(first_station_name, last_station_name)
    routes.has_key?(first_station_name) && routes[first_station_name].has_key?(last_station_name) ? routes[first_station_name][last_station_name] : nil
  end

  def get_station(station_name)
    stations[station_name]
  end

  def get_train(number)
    train = trains[number]
  end
 end
