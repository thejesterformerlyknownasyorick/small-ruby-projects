
#iteration loop
def fibs(int)
    fib_arr = [0, 1]
    i = 2
    fib_sum = 1
    fib_num = 0
    if int == 1
        fib_arr = [0]
    else
        while i < int
            hold = fib_sum
            fib_sum += fib_num
            fib_num = hold
            fib_arr.push(fib_sum)
            i += 1
        end
    end
    fib_arr
end

#recursive
def fib_rec(number, array = [0, 1])
    array << (array[-1] + array[-2])
    if array.length < number
        fib_rec(number, array)
    end
    array
end

p fib_rec(8)