class Node
  attr_accessor :value, :next, :prev

  def initialize(value=nil)
    @next = nil
    @prev = nil
    @value = value
  end

  def traverse(forward=true, &block)
    node = self
    while node
      yield node.value
      node = forward ? node.next : node.prev
    end
  end

  def delete(node=self)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def find(value, node=self)
    while node
      break if node.value == value
      node = node.next
    end
    node
  end

  def find_and_delete(value)
    node = find(value)
    node.delete if node
    node
  end

  def append(new_node, list_node=self)
    until list_node.next.nil?
      list_node = list_node.next
    end

    list_node.next = new_node
    new_node.prev = list_node
  end

  def to_s
    string = ''
    traverse { |n| string << n }
    string << "\n"
  end
end

# build linked list
a = Node.new('A')
b = Node.new('B')
c = Node.new('C')
d = Node.new('D')
e = Node.new('E')

list = a
last = e

list.append(b)
list.append(c)
list.append(d)
list.append(e)

# traverse list
list.traverse        { |n| print n }; puts '' # ABCDE
last.traverse(false) { |n| print n }; puts '' # EDCBA

# delete node
c.delete
list.traverse { |n| print n }; puts '' # ABDE

# find node
puts list.find('B').value # B

# find and delete node
list.find_and_delete('B')
puts list # ADE
