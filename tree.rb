require_relative 'node.rb'

class Tree
  attr_accessor :root, :data_array
  def initialize(data_array)
    @root = nil
    @data_array = data_array
  end

  def build_tree
    data_sorted = data_array.uniq.sort
    if data_sorted.empty?
      return nil
    else
      return constructTreeFromArray(data_sorted, 0, data_sorted.length - 1)
    end
  end

  def constructTreeFromArray(data_sorted, left, right)
    if left > right
      return nil
    else
      mid = left + (right - left) / 2
      node = Node.new(data_sorted[mid])
      node.left = constructTreeFromArray(data_sorted, left, mid - 1)
      node.right = constructTreeFromArray(data_sorted, mid + 1, right)
      return node.value # root node
    end
  end



  def insert(value)
  end

  def delete(value)
  end

  
end

binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p binary.build_tree
