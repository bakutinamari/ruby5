require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(total_seats)
    super('passenger', total_seats)
  end

  def take_seat
    @used_place += 1 if free_seats.positive?
  end

  def free_seats
    free_place
  end
end
