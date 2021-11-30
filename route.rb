require_relative 'instance_counter'

class Route
  include InstanceCounter
  include Validation
    attr_reader :stations
    
    validate :stations, :type, Station
  
    def initialize(station_first,station_last)
      validate!
      @stations = [station_first,station_last]
      
   end
  
    def add_station(station)
       validate!
        stations.insert(-2, station)
    end
  
    def del_station(station)
       validate!
        stations.delete(station)
    end
  end
