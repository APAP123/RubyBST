# Just a simple run through of some of the Tree functions to ensure they're working properly.
require './binary_search_tree'

arr = (Array.new(15) {rand(1..100) })
tree = Tree.new(arr.sort.uniq)

tree.pretty_print
puts "Balanced? #{tree.balanced?}"
puts "\n\n\n"

puts "level order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"
puts "\n\n\n"

puts 'Adding 5 random numbers > 100...'
tree.insert(rand(100..200))
tree.insert(rand(100..200))
tree.insert(rand(100..200))
tree.insert(rand(100..200))
tree.insert(rand(100..200))
tree.pretty_print
puts "Balanced? #{tree.balanced?}"
puts "\n\n\n"

puts 'Balancing...'
tree.rebalance
tree.pretty_print
puts "Balanced? #{tree.balanced?}"
puts "\n\n\n"

puts "level order: #{tree.level_order}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts "Inorder: #{tree.inorder}"
