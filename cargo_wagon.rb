require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(total_volume)
    super('cargo', total_volume)
  end

  def add_volume(volume)
    @used_place += volume if free_volume > volume
  end

  def free_volume
    free_place
  end
end
