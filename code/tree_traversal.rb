
class Node
  attr_accessor :value, :left, :right

  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left  = left
    @right = right
  end

  def pre_order_recursive(node=self, &block)
    return if node.nil?

    yield node.value
    pre_order_recursive(node.left,  &block)
    pre_order_recursive(node.right, &block)
  end

  def in_order_recursive(node=self, &block)
    return if node.nil?

    in_order_recursive(node.left,  &block)
    yield node.value
    in_order_recursive(node.right, &block)
  end

  def post_order_recursive(node=self, &block)
    return if node.nil?

    post_order_recursive(node.left,  &block)
    post_order_recursive(node.right, &block)
    yield node.value
  end

  def pre_order_iterative(node=self)
    stack = []
    stack.push(node)

    while !stack.empty?
      node = stack.pop
      yield node.value
      stack.push(node.right) if node.right
      stack.push(node.left)  if node.left
    end
  end

  def in_order_iterative(node=self)
    stack = []

    while !stack.empty? || !node.nil?
      if node
        stack.push node
        node = node.left
      else
        node = stack.pop
        yield node.value
        node = node.right
      end
    end
  end

  def post_order_iterative(node=self, &block)
    return if node.nil?

    post_order(node.left,  &block)
    post_order(node.right, &block)
    yield node.value
  end

  def level_order_iterative(node=self, &block)
    queue = []
    queue.push node
    while !queue.empty?
      node = queue.shift
      yield node.value
      queue.push node.left  if node.left
      queue.push node.right if node.right
    end
  end

  # n-ary tree (taken from http://haozeng.github.io/blog/2014/01/05/trees-in-ruby/)
  # def bfs(node)
  #   queue = []
  #   queue.push(node)
  #
  #   while(queue.size != 0)
  #     n = queue.shift
  #     puts n.value
  #     n.children.each do |child|
  #       queue.push(child)
  #     end
  #   end
  # end
  #
  # bfs(root)
  #
  # puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  #
  # def dfs(node)
  #   puts node.value
  #   node.children.each do |child|
  #     dfs(child)
  #   end
  # end
  #
  # dfs(root)
end

# graph dfs/bfs using adjacency matrix in ruby https://www.sitepoint.com/graph-algorithms-ruby/


# build the tree
a = Node.new('A')
b = Node.new('B')
c = Node.new('C')
d = Node.new('D')
e = Node.new('E')
f = Node.new('F')
g = Node.new('G')

tree = d

d.left  = b
d.right = f

b.left  = a
b.right = c

f.left  = e
f.right = g

# show the traversal orders
puts tree.pre_order_recursive   { |node| print node }  # DBACFEG
puts tree.in_order_recursive    { |node| print node }  # ABCDEFG
puts tree.post_order_recursive  { |node| print node }  # ACBEGFD
puts tree.pre_order_iterative   { |node| print node }  # DBACFEG
puts tree.in_order_iterative    { |node| print node }  # ABCDEFG
puts tree.level_order_iterative { |node| print node }  # DBFACEG
