module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    def up_instances
      @instaces ||= 0 
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.up_instance
    end
  end
end
