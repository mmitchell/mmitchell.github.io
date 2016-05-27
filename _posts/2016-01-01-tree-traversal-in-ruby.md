---
title: Tree Traversal in Ruby
category: 'Data Structures & Algorithms'
short_desc: Traversing a binary tree in different orders in Ruby.
---

{% highlight ruby %}

class Node
  attr_accessor :value, :left, :right

  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left  = left
    @right = right
  end

  def pre_order(node=self, &block)
    return if node.nil?

    yield node.value
    pre_order(node.left,  &block)
    pre_order(node.right, &block)
  end

  def in_order(node=self, &block)
    return if node.nil?

    in_order(node.left,  &block)
    yield node.value
    in_order(node.right, &block)
  end

  def post_order(node=self, &block)
    return if node.nil?

    post_order(node.left,  &block)
    post_order(node.right, &block)
    yield node.value
  end

  def level_order(node=self, &block)
    queue = []
    queue.push node
    while !queue.empty?
      node = queue.shift
      yield node.value
      queue.push node.left  if node.left
      queue.push node.right if node.right
    end
  end
end

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
puts tree.pre_order   { |node| print node }  # DBACFEG
puts tree.in_order    { |node| print node }  # ABCDEFG
puts tree.post_order  { |node| print node }  # ACBEGFD
puts tree.level_order { |node| print node }  # DBFACEG

{% endhighlight %}