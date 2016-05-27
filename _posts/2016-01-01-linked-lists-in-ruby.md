---
title: Linked Lists in Ruby
category: 'Data Structures & Algorithms'
short_desc: A basic singly linked list in Ruby with common operations.
---

{% highlight ruby %}

class Node
  attr_accessor :value, :next

  def initialize(value=nil)
    @next = nil
    @value = value
  end

  def traverse
    node = self
    while node
      print node.value
      node = node.next
    end
    print "\n"
  end
end

# build linked list
a = Node.new('A')
b = Node.new('B')
c = Node.new('C')
d = Node.new('D')
e = Node.new('E')

list = a

a.next = b
b.next = c
c.next = d
d.next = e

# traverse list
list.traverse # ABCDE

{% endhighlight %}
