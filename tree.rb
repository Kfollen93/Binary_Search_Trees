require_relative 'node.rb'

class Tree
    attr_accessor :root, :data_array
    def initialize(data_array)
        @root = nil
        @data_array = data_array
    end

    def build_tree
        data_sorted = data_array.uniq.sort
        data_length = data_sorted.length
        data_median = (data_sorted[(data_length - 1) / 2] + data_sorted[data_length / 2]) / 2.0
        node = Node.new(data_median)

        if data_array.empty?
            return nil
        elsif @root == nil
            @root = node.value
        else
            node.next_node = @root
            @root = node.value
        end
    end
end

binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
binary.build_tree

