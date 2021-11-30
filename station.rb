require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation
  attr_reader :name, :trains
  
  validate :name, :type, String
  
  @@stations = []
  def self.all
    @@stations
  end
  
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations.push(self)
    
  end
  
  def each_train(&block)
    trains.each(&block)
  end
  
  def add_train(train)
    trains << train
  end
  
  def del_train(train)
    trains.delete(train)
  end
  
  def get_trains_type(train_type)
    trains.select{|x|x.train_type == train_type}
  end
end
