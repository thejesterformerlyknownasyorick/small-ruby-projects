def bubble_sort(array)
    while true do
        i = 0
        x = 0
        while i < array.length
            y = i + 1
            while y =< array.length
                if array[i] > array.[y]
                    holder = array[i]
                    array[i] = array[y]
                    array[y] = holder
                    x += 1
                end
            end
        end
        break if x == 0
    end
array
end
    

p bubble_sort([4,3,78,2,0,2])