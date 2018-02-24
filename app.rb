require './lib/coin_calc'


# Case with default currency list
# input : quarter: 25, dime: 10, nickel: 5, penny: 1
# output # change_for(25) : {:quarter=>1}
# output # change_for(41) : {:quarter=>1, :dime=>1, :nickel=>1, :penny=>1}

begin
	puts CoinCalc.new.change_for(25)
	puts CoinCalc.new.change_for(41)
rescue RuntimeError => exception
	puts "[Invalid] #{exception.class}: #{exception.message}"
rescue => exception
	puts "#{exception.class}: #{exception.message}"
end

# Case with different currency list 
# input : curr1: 5, curr2: 1, curr3: 3
# output # change_for(25) : {:curr1=>5}

begin
	puts CoinCalc.new(curr1: 5, curr2: 1, curr3: 3).change_for(25)
rescue RuntimeError => exception
	puts "[Invalid] #{exception.class}: #{exception.message}"
rescue => exception
	puts "#{exception.class}: #{exception.message}"
end