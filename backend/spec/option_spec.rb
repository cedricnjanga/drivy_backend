require 'minitest/autorun'
require_relative '../lib/option.rb'

describe Option do
	describe '#price_per_day' do
		it 'should return right amount' do
			gps_option = Option.new(id: 1, rental_id: 1, type: 'gps')
			assert_equal(500, gps_option.price_per_day)

			baby_seat_option = Option.new(id: 1, rental_id: 1, type: 'baby_seat')
			assert_equal(200, baby_seat_option.price_per_day)

			additional_insurance_option = Option.new(id: 1, rental_id: 1, type: 'additional_insurance')
			assert_equal(1000, additional_insurance_option.price_per_day)
		end
	end
end
