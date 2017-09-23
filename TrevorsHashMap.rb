require_relative 'LinkedList'
require_relative 'Node'

class TrevorsHashMap
  attr_reader :size
  attr_reader :current_size
  attr_reader :num_buckets

  def initialize( size )
    # This is a naive implimentation where I set a strict max bucket depth of 4
    # and base my number of buckets on this and the size. In a real implimentation
    # we would do something fun like dynamically add more buckets.
    @size = size
    @current_size = 0
    @bucket_depth = 4
    @num_buckets = ( @size.to_f / @bucket_depth ).ceil # Force float here
    @buckets = build_buckets( @num_buckets )
  end

  def set( key, value )
    id = get_bucket( key )
    if @current_size < @size
      @current_size += 1
      @buckets[id].set( key, value )
    else
      return false
    end
  end

  def get( key )
    # Where shall we look?
    id = get_bucket( key )
    # Commence looking
    @buckets[id].get( key )
  end

  def delete( key )
    id = get_bucket( key )
    @current_size -= 1
    # Goodbye cruel list
    @buckets[id].delete( key )
  end

  def load
    @current_size.to_f / @size
  end

private

  def build_buckets( num )
    buckets = []
    num.times do |n|
      buckets << LinkedList.new( @bucket_depth )
    end
    buckets
  end

  # This is our hashing function. It's pretty naive, we're just going to sum the
  # ASCII values of the string and mod by the number of buckets.
  def get_bucket( str )
    sum = 0
    str.each_char do |c|
      sum += c.ord
    end
    sum % @num_buckets
  end

end
