require 'minitest/autorun'
require_relative '../lib/price.rb'

describe Price::Duration do
	describe '#to_i' do
		it 'should return right number' do
			price = Price::Duration.new 100, 1
			assert_equal(100, price.to_i)

			price = Price::Duration.new 100, 2
			assert_equal(190, price.to_i)

			price = Price::Duration.new 100, 3
			assert_equal(280 , price.to_i)

			price = Price::Duration.new 100, 4
			assert_equal(370, price.to_i)
	
			price = Price::Duration.new 100, 5
			assert_equal(440, price.to_i)
		
			price = Price::Duration.new 100, 10
			assert_equal(790, price.to_i)

			price = Price::Duration.new 100, 11
			assert_equal(840, price.to_i)

			price = Price::Duration.new 100, 40
			assert_equal(2290, price.to_i)
		end
	end

	describe '#full_price_days' do
		it 'should return right number' do
			price = Price::Duration.new 1, 1
			assert_equal(1, price.full_price_days)

			price = Price::Duration.new 1, 40
			assert_equal(1, price.full_price_days)
		end
	end

	describe '#ten_percent_price_days' do
		it 'should return right number' do
			price = Price::Duration.new 1, 1
			assert_equal(0, price.ten_percent_price_days)

			price = Price::Duration.new 1, 2
			assert_equal(1, price.ten_percent_price_days)

			price = Price::Duration.new 1, 3
			assert_equal(2, price.ten_percent_price_days)

			price = Price::Duration.new 1, 4
			assert_equal(3, price.ten_percent_price_days)

			price = Price::Duration.new 1, 40
			assert_equal(3, price.ten_percent_price_days)
		end
	end

	describe '#thirty_percent_price_days' do
		it 'should return right number' do
			price = Price::Duration.new 1, 1
			assert_equal(0, price.thirty_percent_price_days)

			price = Price::Duration.new 1, 2
			assert_equal(0, price.thirty_percent_price_days)

			price = Price::Duration.new 1, 3
			assert_equal(0, price.thirty_percent_price_days)

			price = Price::Duration.new 1, 4
			assert_equal(0, price.thirty_percent_price_days)
	
			price = Price::Duration.new 1, 5
			assert_equal(1, price.thirty_percent_price_days)
		
			price = Price::Duration.new 1, 10
			assert_equal(6, price.thirty_percent_price_days)

			price = Price::Duration.new 1, 40
			assert_equal(6, price.thirty_percent_price_days)
		end
	end

	describe '#half_price_days' do
		it 'should return right number' do
			price = Price::Duration.new 1, 1
			assert_equal(0, price.half_price_days)

			price = Price::Duration.new 1, 2
			assert_equal(0, price.half_price_days)

			price = Price::Duration.new 1, 3
			assert_equal(0, price.half_price_days)

			price = Price::Duration.new 1, 4
			assert_equal(0, price.half_price_days)
	
			price = Price::Duration.new 1, 5
			assert_equal(0, price.half_price_days)
		
			price = Price::Duration.new 1, 10
			assert_equal(0, price.half_price_days)

			price = Price::Duration.new 1, 11
			assert_equal(1, price.half_price_days)

			price = Price::Duration.new 1, 40
			assert_equal(30, price.half_price_days)
		end
	end
end
