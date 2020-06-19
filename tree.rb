require_relative 'node.rb'

class Tree
  attr_accessor :root

  def initialize(data_array)
    @root = build_tree(data_array)
  end

  def build_tree(data_array)
    data_sorted = data_array.uniq.sort
    return nil if data_sorted.empty?
    return Node.new(data_sorted.first) if data_sorted.length < 2

    mid = data_sorted.length / 2
    node = Node.new(data_sorted[mid])
    node.left = build_tree(data_sorted.take(mid))
    node.right = build_tree(data_sorted.drop(mid + 1))
    node
  end

  # INSERT METHOD
  def insert(value, node = @root)
    if value == node.data
      return nil
    elsif node.right.nil? && value > node.data
      node.right = Node.new(value)
    elsif node.left.nil? && value < node.data
      node.left = Node.new(value)
    elsif value < node.data
      insert(value, node.left)
    elsif value > node.data
      insert(value, node.right)
    end
  end
# ---------------------------------








  def delete(value, node = @root)
=begin
  1. No subtree (no children): This one is the easiest one.
  You can simply just delete the node, without any additional actions required.
  2. One subtree (one child): You have to make sure that after the node is deleted,
  its child is then connected to the deleted node’s parent.
  3. Two subtrees (two children): You have to find and replace the node you want to delete,
  with its successor (the letfmost node in the right subtree).

    return nil if node.nil?

    if value == node.data && node.left.nil? && node.right.nil?
      #if node.left.nil? && node.right.nil?
      return nil # Is the same as doing node = nil
      #end
    elsif value < node.data
      node.left = delete(value, node.left)
      return node
    else 
      node.right = delete(value, node.right)
      return node
    end
=end


    if node == nil
      return nil
    elsif value < node.data
      node.left = delete(value, node.left)
      return node
    elsif value > node.data
      node.right = delete(value, node.right)
      return node
    else # node has been located to delete:
      # case 1
      if node.left.nil? && node.right.nil?
        node = nil
        return node
      elsif #this will be case 2
      end
    end




  end













  # FIND METHOD
  def find(value, node = @root) 
    return nil if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      return node
    end
end
end

binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# binary.find(7)
binary.insert(222)
binary.delete(1)
p binary.root


