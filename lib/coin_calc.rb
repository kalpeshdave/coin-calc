class CoinCalc
	# DEFAULTS BEING MERGED IF NO ARGUMENT PASSED
	DEFAULT = {quarter: 25, dime: 10, nickel: 5, penny: 1}
	attr_accessor :input_currency

	def initialize(input_currency = {})
		@coins = input_currency.empty? ? DEFAULT.merge(input_currency) : input_currency
		raise "Ooopsss.... Input currency values should be greater than 0" if @coins.values.any?{|val| val <= 0}
		@output = @coins.keys.each_with_object({}) { |key, hash| hash[key] = 0 }
	end

	def change_for(input_amount)
		raise "Ooopsss.... Input amount should not be negative." if input_amount < 0
		@coins.each do |curr, val|
			while input_amount >= val
		        @output[curr] += 1
		        input_amount -= val
		    end
		end

		@output.delete_if { |k,v| v == 0 }
	end

end
