# Represents a node on the binary-search tree
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# binary-search tree
class Tree
  # todo
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  # Builds binary-search tree from given array
  def build_tree(array)
    return Node.new(array[0]) if array.length == 1
    return nil if array.empty? || array.nil?

    mid = array.length / 2
    node = Node.new(array[mid])

    node.left = build_tree(array[0..mid - 1])
    node.right = build_tree(array[mid + 1, array.length])
    node
  end

  # Inserts a new node to the tree
  def insert(value, node = @root)
    return if value == node.data # prevents dupes

    if value < node.data
      return node.left = Node.new(value) if node.left.nil?

      insert(value, node.left)
    else
      return node.right = Node.new(value) if node.right.nil?

      insert(value, node.right)
    end
  end

  # Returns the amount of branches a node has
  def branches(node)
    return 'both' if !node.left.nil? && !node.right.nil?
    return 'left' if !node.left.nil?
    return 'right' if !node.right.nil?
    return 'none' if node.left.nil? && node.right.nil?
  end

  # Returns parent of node with matching value
  def get_parent(value, node = @root)
    return node if node.left.data == value || node.right.data == value || node.nil?

    if value < node.data
      get_parent(value, node.left)
    else
      get_parent(value, node.right)
    end
  end

  # Returns next highest valued node after the passed node
  def find_next_highest(node)
    return node if node.left.nil?

    find_next_highest(node.left)
  end

  # Deletes the passed value from the tree
  def delete(value)
    # You can definitely simplify this
    node = find(value)
    return if node.nil?

    parent = get_parent(value)
    case branches(node)
    when 'none'
      return parent.left = nil if parent.left.data == value
      return parent.right = nil if parent.right.data == value
    when 'left'
      return parent.left = node.left if parent.left.data == value
      return parent.right = node.left if parent.right.data == value
    when 'right'
      return parent.left = node.right if parent.left.data == value
      return parent.right = node.right if parent.right.data == value
    when 'both'
      next_highest = find_next_highest(node.right)
      delete(next_highest.data)
      return parent.left.data = next_highest.data if parent.left.data == value
      return parent.right.data = next_highest.data if parent.right.data == value
    end
  end

  # returns the node matching the given value
  def find(value, node = @root)
    return node if value == node.data || node.nil?

    if value < node.data
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  # Takes an array of nodes and returns an array of their respective values
  def node_array_to_values(array)
    new_array = []
    array.each do |element|
      if element.is_a?(Integer)
        new_array.push(element)
      elsif element.is_a?(Node)
        new_array.push(element.data)
      end
    end
    new_array
  end

  # Traverses tree is breadth-first level order and yields each node to provided block
  def level_order
    queue = [@root]
    node = queue[0]
    index = 0
    while index < queue.length
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
      yield queue[index] if block_given?
      index += 1
      node = queue[index]
    end
    return node_array_to_values(queue) unless block_given?
  end

  # Traverses tree in in-order (left, root, right) depth-first, yielding nodes to provided block
  def inorder(node, result = [], &block)
    return if node.nil?

    result.push(inorder(node.left, &block))
    result.push(node)
    block.call node if block_given?
    result.push(inorder(node.right, &block))
    return node_array_to_values(result.flatten) unless block_given?
  end

  # Traverses tree in pre-order (root, left, right) depth-first, yielding nodes to provided block
  def preorder(node, result = [], &block)
    return if node.nil?

    result.push(node)

    block.call node if block_given?

    result.push(preorder(node.left, &block))
    result.push(preorder(node.right, &block))
    return node_array_to_values(result.flatten) unless block_given?
  end

  # Traverses tree in post-order (left, right, root) depth-first, yielding nodes to provided block
  def postorder(node, result = [], &block)
    return if node.nil?

    result.push(postorder(node.left, &block))
    result.push(postorder(node.right, &block))
    result.push(node)
    block.call node if block_given?
    return node_array_to_values(result.flatten) unless block_given?
  end

  # Returns height of given node
  def height(node)
    # todo
  end

  # Returns depth of given node
  def depth(node)
    # todo
  end

  # Checks left subtree and right subtree of each node to see if height differences between the two is no more than one
  def balanced?
    # todo
  end

  # Rebalances tree so that no node has a right subtree and left subtree with a height difference greater than one
  def rebalance
    # todo
  end

  # Method for printing BST to screen in a pretty manner (preorderwritten by a fellow Odin Project student)
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# arr = ['F', 'D', 'J', 'B', 'E', 'G', 'K', 'A', 'C', 'I', 'H']
# arr = ['F', 'D', 'J', 'B', 'E', 'G', 'B', 'K', 'A', 'C', 'I', 'H']
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr.sort.uniq)

tree.pretty_print
puts "\n\n\n"
# tree.insert(2)
tree.insert(23)
tree.pretty_print
tree.delete(4)
puts "\n\n\n"
tree.pretty_print

# tree.level_order do |node|
#   puts "level order data is #{node.data}"
# end

# puts tree.level_order

tree.preorder(tree.root) do |node|
  puts "preorder data is #{node.data}"
end
puts "before no block pre"
puts "preorder no block: #{tree.preorder(tree.root)}"

tree.inorder(tree.root) do |node|
  puts "preorder data is #{node.data}"
end
puts "before no block in"
puts "inorder no block: #{tree.inorder(tree.root)}"

tree.postorder(tree.root) do |node|
  puts "postorder data is #{node.data}"
end
puts "before no block in"
puts "postorder no block: #{tree.postorder(tree.root)}"