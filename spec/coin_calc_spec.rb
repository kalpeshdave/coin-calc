require 'rspec'
require_relative '../lib/coin_calc.rb'

describe "CoinCalc" do

	it('divides coins into quarters, dime, nickel, penny') do
		expect(CoinCalc.new.change_for(25)).not_to be_nil
		expect(CoinCalc.new.change_for(25)).to eq({:quarter=>1})
		expect(CoinCalc.new.change_for(41)).to eq({:quarter=>1, :dime=>1, :nickel=>1, :penny=>1})
	end

	it('divides coins into custom currency') do 
		expect(CoinCalc.new(curr1: 5, curr2: 1, curr3: 3).change_for(25)).to eq({:curr1=>5})
	end

	it('raise invalid input if negative coins') do
		expect{ CoinCalc.new.change_for(-25) }.to raise_error(RuntimeError, "Ooopsss.... Input amount should not be negative.")
	end

	it('raise invalid input if negative currency value') do
		expect{ CoinCalc.new(quarter: -25).change_for(25) }.to raise_error(RuntimeError, "Ooopsss.... Input currency values should be greater than 0")
	end

end
