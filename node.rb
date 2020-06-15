class Node
    attr_accessor :parent, :left_child, :right_child, :next_node, :value
    def initialize(value = nil, next_node = nil)
        @parent = parent
        @left_child = left_child
        @right_child = right_child
        @next_node = next_node
        @value = value
    end
end