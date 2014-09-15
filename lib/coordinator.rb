require "coordinator/version"

class Coordinator
  attr_reader :connection, :ratio
  def initialize(connection, ratio)
    @connection, @ration = connection, ratio
  end

  def type
    get_ratio
  end
end
