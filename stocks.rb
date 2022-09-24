def stock_picker(prices)
    profit = 0
    day_array = []

    prices.each_with_index do |price1, day1|
        prices.each_with_index do |price2, day2|
            if profit < price2 - price1 && day2 > day1
                profit = price2 - price1
                day_array = [day1, day2]
            end
        end
    end
    day_array
end


p stock_picker([17,30,1,9,15,8,13,16,10])