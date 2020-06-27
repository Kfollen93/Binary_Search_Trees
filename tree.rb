# frozen_string_literal: true

require_relative 'node.rb'
# Creates a tree and organization of nodes.
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

  def insert(value, node = @root)
    return nil if value == node.data

    if node.right.nil? && value > node.data
      node.right = Node.new(value)
    elsif node.left.nil? && value < node.data
      node.left = Node.new(value)
    elsif value < node.data
      insert(value, node.left)
    elsif value > node.data
      insert(value, node.right)
    end
  end

  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
      return node
    elsif value > node.data
      node.right = delete(value, node.right)
      return node
    else # node has been located to delete:
      if node.left.nil? && node.right.nil? # CASE 1: No children
        node = nil
      elsif node.left.nil? # CASE 2: One child
        node = node.right
      elsif node.right.nil?
        node = node.left
      elsif !node.left.nil? && !node.right.nil? # CASE 3: Two children
        successor = node.right
        if successor.left.nil? # edge case check
          node.data = successor.data
          node.right = successor.right
        end
        until successor.left.nil?
          successor_parent = successor
          successor = successor.left
          node.data = successor.data
          successor_parent.left = successor.right
        end
      end
    end

    node
  end

  def find(value, node = @root)
    return nil if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      node
    end
  end

  def level_order(node = @root, queue = [node], output = [])
    until queue.empty?
      current = queue.shift # 8. Shift removes & returns the num from queue.
      output.push(current.data) # pushing the current number, 8, to output.
      current.left ? queue.push(current.left) : nil # 8 has a left, push 4.
      current.right ? queue.push(current.right) : nil # 8 has a right, push 67.
    end
    output # array which is being used by the rebalance method
  end

  def pre_order(node = @root)
    # <root> <left> <right>
    return if node.nil?

    print "#{node.data} "
    pre_order(node.left)
    pre_order(node.right)
  end

  def in_order(node = @root)
    # <left> <root> <right>
    return if node.nil?

    in_order(node.left)
    print "#{node.data} "
    in_order(node.right)
  end

  def post_order(node = @root)
    # <left> <right> <root>
    return if node.nil?

    post_order(node.left)
    post_order(node.right)
    print "#{node.data} "
  end

  def height(node = @root)
    return -1 if node.nil? # return -1 because last edge points to nil.

    height(node.left) > height(node.right) ? height(node.left) + 1 : height(node.right) + 1
  end

  def balanced?(node = @root)
    return false unless (height(node.left) - height(node.right)).abs <= 1

    if node.left
      return false unless balanced?(node.left)
    end
    if node.right
      return false unless balanced?(node.right)
    end
    true
  end

  def rebalance
    array = level_order(@root)
    @root = build_tree(array)
  end
end

# binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# binary.find(7)
# binary.insert(222)
# binary.delete(67)
# binary.root
# binary.level_order
# binary.pre_order
# binary.in_order
# binary.post_order
# binary.height
# binary.balanced?
# binary.rebalance
# binary.balanced?

# Driver Script
binary = Tree.new(Array.new(15) { rand(1..100) })
p binary.balanced?
p binary.level_order
puts ''
binary.pre_order
puts ''
binary.post_order
puts ''
binary.in_order
puts ''
binary.insert(120)
binary.insert(140)
binary.insert(620)
binary.insert(350)
p binary.balanced?
binary.rebalance
p binary.balanced?
p binary.level_order
puts ''
binary.pre_order
puts ''
binary.post_order
puts ''
binary.in_order
puts ''

