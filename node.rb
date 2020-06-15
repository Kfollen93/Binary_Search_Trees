class Node
    attr_accessor :left_parent, :right_parent, :left_tree, :right_tree, :left_child, :right_child, :next_node, :value
    def initialize(value = nil, next_node = nil)
        @left_parent = left_parent
        @right_parent = right_parent
        @left_tree = left_tree
        @right_tree = right_tree
        @left_child = left_child
        @right_child = right_child
        @next_node = next_node
        @value = value
    end
end