require 'minitest/autorun'
require_relative '../lib/database.rb'
require_relative '../lib/car.rb'
require_relative '../lib/rental.rb'

describe Database do
	before do
		@database = Database.new 'level1'
	end

	describe '#cars' do
		it 'should map car collection coming from json file' do
			assert_equal(@database.cars.length, 3)

			car = @database.cars.first

			assert_instance_of(Car, car)
			assert_equal(car.id, 1)
			assert_equal(car.price_per_day, 2000)
			assert_equal(car.price_per_km, 10)
		end
	end

	describe '#rentals' do
		it 'should map rental collection coming from json file' do
			assert_equal(@database.rentals.length, 3)

			rental = @database.rentals.first

			assert_instance_of(Rental, rental)
			assert_equal(rental.id, 1)
			assert_equal(rental.car_id, 1)
			assert_equal(rental.distance, 100)
		end
	end
end
