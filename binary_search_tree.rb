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

    def insert (value, node = root)
        if value == node.data
            return nil
        elsif value < node.data
            node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
        end
    end

    def delete(value, node = root)
        if node == nil
            return nil
        elsif value < node.data
            if node.left.data == value
                if node.left.left.nil? && node.left.right.nil?
                    node.left.data = nil
                    node.left = nil
                elsif node.left.left.nil?
                    node.left.data = nil
                    node.left = node.left.right
                else
                    node.right.data = min(node.right)
                    delete(node.right.data, node.right.right)
                end
            else
                delete(value, node.left)
            end
        elsif value > node.data
            if node.right.data == value
                if node.left.left.nil?  && node.left.right.nil?
                    node.right.data = nil
                    node.left = nil
                elsif node.right.right.nil?
                    node.right.data = nil
                    node.right = node.right.left
                else
                    node.right.data = min(node.right)
                end
            else
                delete(value, node.right)
            end
        end
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def min(node)
        
        current_node = node

        until current_node.left == nil
            current_node = current_node.right.left
        end

        current_node.data
    end

end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)

tree.pretty_print

tree.insert(65)
tree.insert(66)
tree.insert(64)
tree.delete(23)

tree.pretty_print