require_relative 'manufacturer'

class Wagon
  include Manufacturer
  attr_reader :type, :total_place, :used_plase

  def initialize(type, total_place)
    @type = type
    @total_place = total_place
    @used_place = 0
  end

  def free_place
    total_place - used_plase
  end
end
