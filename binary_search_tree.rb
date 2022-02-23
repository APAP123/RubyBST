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
    if value < node.data && node.left.nil?
      return node.left = Node.new(value)
    elsif value > node.data && node.right.nil?
      return node.right = Node.new(value)
    end

    if value < node.data
      insert(value, node.left)
    else
      insert(value, node.right)
    end
  end

  # returns the node matching the given value
  def find(value)
    # todo
  end

  # Traverses tree is breadth-first level order and yields each node to provided block
  def level_order
    # todo
  end

  # Traverses tree in in-order depth-first, yielding nodes to provided block
  def inorder
    # todo
  end

  # Traverses tree in pre-order depth-first, yielding nodes to provided block
  def preorder
    # todo
  end

  # Traverses tree in post-order depth-first, yielding nodes to provided block
  def postorder
    # todo
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

  # Method for printing BST to screen in a pretty manner (written by a fellow Odin Project student)
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

tree.insert(2)
tree.pretty_print