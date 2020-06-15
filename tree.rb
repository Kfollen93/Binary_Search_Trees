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
        node_root = Node.new(data_median.to_i)

        if data_sorted.empty?
            return nil
        elsif @root == nil
            @root = node_root.value
        else
            node_root.next_node = @root
            @root = node_root.value
        end
    end
end

binary = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p binary.build_tree

