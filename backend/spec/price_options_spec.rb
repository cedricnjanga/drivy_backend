require 'minitest/autorun'
require_relative '../lib/price.rb'
require_relative '../lib/option.rb'

describe Price::Options do
	before do
		@price_without_options = Price::Options.new([], 1)
	end

	describe '#gps' do
		describe 'when gps option is not present' do
			it 'should return 0' do
				assert_equal(0, @price_without_options.gps)
			end
		end

		describe 'when gps option is present' do
			it 'should return right amount' do
				price = Price::Options.new([Option.new(id: 1, type: 'gps', rental_id: 1)], 1)
				assert_equal(500, price.gps)

				price = Price::Options.new([Option.new(id: 1, type: 'gps', rental_id: 1)], 10)
				assert_equal(5000, price.gps)
			end
		end
	end

	describe '#baby_seat' do
		describe 'when gps option is not present' do
			it 'should return 0' do
				assert_equal(0, @price_without_options.gps)
			end
		end

		describe 'when gps option is present' do
			it 'should return right amount' do
				price = Price::Options.new([Option.new(id: 1, type: 'baby_seat', rental_id: 1)], 1)
				assert_equal(200, price.baby_seat)

				price = Price::Options.new([Option.new(id: 1, type: 'baby_seat', rental_id: 1)], 10)
				assert_equal(2000, price.baby_seat)
			end
		end
	end

	describe '#additional_insurance' do
		describe 'when additional_insurance option is not present' do
			it 'should return 0' do
				assert_equal(0, @price_without_options.additional_insurance)
			end
		end

		describe 'when additional_insurance option is present' do
			it 'should return right amount' do
				price = Price::Options.new([Option.new(id: 1, type: 'additional_insurance', rental_id: 1)], 1)
				assert_equal(1000, price.additional_insurance)

				price = Price::Options.new([Option.new(id: 1, type: 'additional_insurance', rental_id: 1)], 10)
				assert_equal(10000, price.additional_insurance)
			end
		end
	end
end
