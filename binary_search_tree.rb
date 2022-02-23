# Represents a node on the binary-search tree
class Node
  attr_accessor :data, :left_node, :right_node

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

  def initialize(root = nil)
    @root = root
  end

  def build_tree(array)
    # todo
  end

  # Inserts a new node to the tree
  def insert(value)
    # todo
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
end
