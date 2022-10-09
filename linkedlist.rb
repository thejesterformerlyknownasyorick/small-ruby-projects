class LinkedList
    attr_accessor :head

    def initialize
        @head = nil 
    end

    def append(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            current_node = @head
            while !current_node.next_node.nil?
                current_node = current_node.next_node
            end
            node = Node.new(value)
            current_node.next_node = node
            @tail = node            
        end
    end

    def prepend(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            current_node = @head
            @head = Node.new(value)
            @head.next_node = current_node
        end
    end

    def size
        i = 0
        current_node = @head
        if current_node.nil?
            return "Hey dummy, try creating a list before you check to see how big it is."
        else               
            while !current_node.next_node.nil?
                current_node = current_node.next_node
                i += 1
            end
            i += 1
            i
        end
    end

    def head
        if @head.nil?
            return "Buddy, there ain't nothing here."
        else
            @head.value
        end
    end

    def tail
        if @head.nil?
            return "You ain't getting no tail tonight buddy."
        else
            current_node = @head
            while !current_node.next_node.nil?
                current_node = current_node.next_node
            end
            current_node.value
        end
    end

    def at(index)
        i = 0
        current_node = @head
        if @head.nil?
            return "I don't know how you expect to find anything in an empty list."
        else
            while i < index - 1
                current_node = current_node.next_node
                i += 1
            end
            current_node.value
        end
    end

    def pop
        if @head.nil?
            return "There ain't nothing to delete. This list is a ghost town."
        else
            current_node = @head
            while !current_node.next_node.next_node.nil?
                current_node = current_node.next_node
            end
            popped = current_node.next_node
            current_node.next_node = nil
            @tail = current_node
            return popped.value
        end
    end

    def contains?(value)
        result = false
        if @head.nil?
            result = "This list is completely empty, so I'm pretty sure it doesn't contain that value."
        else
            current_node = @head
            while !current_node.next_node.nil?
                if current_node.value == value
                    result = true
                end
                current_node = current_node.next_node
            end
        end
        puts result
    end

    def find(value)
        if @head.nil?
            return "There's nothing here to find! This list is emptier than a Trump rally in a city with an average IQ above 60."
        end
        i = 0
        found = false
        current_node = @head
        while !current_node.next_node.nil?
            if current_node.value == value
                found = true
                return i
            else
                current_node = current_node.next_node
                i += 1
            end
        end
        if found == false
            return "That's not on this list, sorry."
        else puts i
        end
    end

    def to_s
        if @head.nil?
            return "Wow, you just saved me a lot of work. That list doesn't exist."
        else
            current_node = @head
            string = ""
            while !current_node.next_node.nil?
                string += "( #{current_node.value} ) -> "
                current_node = current_node.next_node
            end
            string += "nil"
            return string
        end
    end

    class Node
        attr_accessor :value, :next_node

        def initialize(value = nil)
            @value = value
            @next_node = nil
        end

    end

end

list = LinkedList.new
list.append(2)
list.append(4)
list.append(1)
list.prepend(10)
list.prepend(45)
list.append(10)
list.contains?(4)
list.size
puts list.head
puts list.tail
puts list.at(1)
puts list.at(2)
puts list.at(3)
puts list.at(4)
puts list.at(5)
puts list.at(6)
puts list.contains?(45)
puts list.contains?(5)
puts list.contains?(2)
puts list.find(4)
puts list.find(5)
puts list.to_s