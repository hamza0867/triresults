class Placing
  attr_accessor :name, :place

  def initialize(name, place)
    @name = name
    @place = place
  end

  def mongoize
    instance_values.symbolize_keys
  end

  def self.mongoize(object)
    case object
    when nil then nil
    when Hash then object.slice(:name, :place)
    when Placing then object.mongoize
    end
  end

  def self.demongoize(object)
    case object
    when nil then nil
    when Hash then Placing.new(object[:name], object[:place])
    when Placing then object
    end
  end

  def self.evolve(object)
    mongoize(object)
  end
end
