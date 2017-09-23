class Node
  attr_reader :key
  attr_reader :value
  attr_accessor :next

  def initialize( key, value )
    @key = key
    @value = value
    @next = nil
  end

end
