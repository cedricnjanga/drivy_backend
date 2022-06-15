require 'minitest/autorun'
require_relative '../lib/price.rb'

describe Price::Distance do
	describe '#to_i' do
		it 'should return right number' do
			price = Price::Distance.new 100, 1
			assert_equal(100, price.to_i)

			price = Price::Distance.new 100, 2
			assert_equal(200, price.to_i)

			price = Price::Distance.new 100, 3
			assert_equal(300 , price.to_i)

			price = Price::Distance.new 100, 40
			assert_equal(4000, price.to_i)
		end
	end
end
