---
title: Tree Traversal in Ruby
category: 'Data Structures & Algorithms'
short_desc: Traversing a binary tree in different orders in Ruby.
---

{% highlight ruby %}

require 'set'

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
    stack = []
    last_node_visited = nil

    while !stack.empty? || !node.nil?
      if node
        stack.push node
        node = node.left
      else
        peek_node = stack.last
        if peek_node.right && last_node_visited != peek_node.right
          node = peek_node.right
        else
          yield peek_node.value
          last_node_visited = stack.pop
        end
      end
    end
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

  def graph_bfs(node=self)
    queue = []
    queue.push node
    visited = Set.new

    while !queue.empty?
      node = queue.shift
      yield node.value
      visited.add?(node)

      node.adjacents.each do |adjacent_node|
        next if visited.include?(adjacent_node) || adjacent_node.nil?
        queue.push(adjacent_node)
      end
    end
  end

  def adjacents
    [@left, @right]
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
puts tree.pre_order_recursive   { |node| print node }  # DBACFEG
puts tree.in_order_recursive    { |node| print node }  # ABCDEFG
puts tree.post_order_recursive  { |node| print node }  # ACBEGFD
puts tree.pre_order_iterative   { |node| print node }  # DBACFEG
puts tree.in_order_iterative    { |node| print node }  # ABCDEFG
puts tree.post_order_iterative  { |node| print node }  # ACBEGFD
puts tree.level_order_iterative { |node| print node }  # DBFACEG
puts tree.graph_bfs             { |node| print node }  # DBFACEG

{% endhighlight %}
