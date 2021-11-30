require_relative 'train'

class CargoTrain < Train
  protected

  # Принцип инкапсуляции,чтобы пользователь не мог изменить данные
  def type
    'cargo'
  end
end
