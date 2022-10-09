class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

end

class Tree
    attr_accessor :data, :root

    def initialize(array)
        @data = array.sort.uniq
        @root = build_tree(data)
    end

    def build_tree(array)
        return nil if array.empty?

        mid = (array.length / 2).round

        root = Node.new(array[mid])

        root.left = build_tree(array[0...mid])
        root.right = build_tree(array[(mid + 1)..-1])

        root
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)

tree.pretty_print