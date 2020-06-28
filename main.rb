# frozen_string_literal: true

require_relative 'node.rb'
require_relative 'tree.rb'

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
p binary.height
binary.delete(120)
p binary.level_order
