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

  def insert(value)
=begin
  It is very similar to the search function. 
  You again start at the root of the tree and go down recursively,
  searching for the right place to insert our new node,
  in the same way as explained in the search function.
  Make sure to check for duplicates and omit if so.


=end

  end

  def delete(value)
=begin
  1. No subtree (no children): This one is the easiest one.
  You can simply just delete the node, without any additional actions required.
  2. One subtree (one child): You have to make sure that after the node is deleted,
  its child is then connected to the deleted node’s parent.
  3. Two subtrees (two children): You have to find and replace the node you want to delete,
  with its successor (the letfmost node in the right subtree).
=end


  end
  
  def find(value)
=begin
  You always start searching the tree at the root node and go down from there.
  You compare the data in each node with the one you are looking for.
  If the compared node doesn’t match then you either proceed to the right child or the left child,
  which depends on the outcome of the following comparison:
  If the node that you are searching for is lower than the one you were comparing it with,
  you proceed to to the left child, otherwise (if it’s larger) you go to the right child. Why?
  Because the BST is structured (as per its definition), that the right child is always larger,
  than the parent and the left child is always lesser.
=end



end

end

binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
#binary.build_tree
