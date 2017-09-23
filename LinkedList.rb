class LinkedList

  def initialize( max_depth )
    @head = nil
    @max_depth =  max_depth
  end

  def set( key, value )
    if @head.nil?
      @head = Node.new( key, value )
    else
      current_node = @head
      while @head.next
        current_node = current_node.next
      end
      current_node.next = Node.new( key, value )
    end
    # Normally we would do error checking and make sure everything saved
    # properly but for not lets just return true because everything
    # is beautiful and happy
    true
  end

  def get( key )
    current_node = @head
    while current_node
      if current_node.key == key
        return current_node.value
      end
      current_node = current_node.next
    end
    return nil # :(
  end

  def delete( key )
    current_node = @head
    current_node_parent = nil
    while current_node
      if current_node.key == key
        if current_node_parent.nil?
          # Then the first node is the one being deleted
          @head = current_node.next
        else
          # Otherwise we're deleting an internal node
          # Goodbye current node, to the garbage collector with thee
          current_node_parent.next = current_node.next
        end
        return current_node.value
      end
      current_node_parent = current_node
      current_node = current_node.next
    end
    nil # :(
  end

end
