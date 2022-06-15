require 'minitest/autorun'
require_relative '../lib/car.rb'

describe Car do
	before do
   	@car = Car.new(id: 1, price_per_day: 1, price_per_km: 1)
  end

	describe '#initialize' do
		it 'should have required attributes' do
			assert_raises(ArgumentError) { Car.new }

			begin
				Car.new
			rescue ArgumentError => e
				assert_equal(e.message, 'missing keywords: :id, :price_per_day, :price_per_km')
			end
		end

		it 'should have attributes readers' do
			assert_respond_to(@car, :id)
			assert_respond_to(@car, :price_per_day)
			assert_respond_to(@car, :price_per_km)
		end
	end
end
