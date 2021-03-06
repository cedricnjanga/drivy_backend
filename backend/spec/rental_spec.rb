require 'minitest/autorun'
require 'ostruct'
require_relative '../lib/rental.rb'
require_relative '../lib/period.rb'
require_relative '../lib/car.rb'
require_relative '../lib/database.rb'
require_relative '../lib/price.rb'

describe Rental do
	before do
		@rental = Rental.new id: 1, car_id: 1, db: Database.new('level5'), start_date: '2022-06-14', end_date: '2022-06-14', distance: 1
	end

	describe '#initialize' do
		it 'should have required attributes' do
			assert_raises(ArgumentError) { Rental.new }

			begin
				Rental.new
			rescue ArgumentError => e
				assert_equal(e.message, 'missing keywords: :id, :car_id, :db, :start_date, :end_date, :distance')
			end
		end
	
		it 'should have attributes readers' do
			assert_respond_to(@rental, :id)
			assert_respond_to(@rental, :car_id)
			assert_respond_to(@rental, :car)
			assert_respond_to(@rental, :period)
			assert_respond_to(@rental, :distance)
			assert_respond_to(@rental, :price)
		end
	end

	describe '#period' do
		it 'should be an instance of Period' do
			assert_instance_of(Period, @rental.period)
		end
	end

	describe '#car' do
		it 'should be an instance of Car' do
			assert_instance_of(Car, @rental.car)
		end
	end

	describe '#price' do
		it 'should be an integer' do
			@rental.stub(:distance_price, 1000) do
				@rental.stub(:duration_price, 1000) do
					assert_instance_of(Integer, @rental.price)
				end
			end
		end
	
		it 'should compute right price' do
			@rental.stub(:price_without_options, 1000) do
				@rental.stub(:options_price, OpenStruct.new(to_i: 1000)) do
					assert_equal(2000, @rental.price)
				end
			end
		end
	end

	describe '#duration_price' do
		it 'should be an instance of Price::Duration' do
			@rental.stub(:period, OpenStruct.new(number_of_days: 5)) do
				@rental.stub(:car, OpenStruct.new(price_per_day: 5)) do
					assert_instance_of(Price::Duration, @rental.duration_price)
				end
			end
		end
	end

	describe '#distance_price' do
		it 'should be an instance of Price::Distance' do
			@rental.stub(:distance, 5) do
				@rental.stub(:car, OpenStruct.new(price_per_km: 5)) do
					assert_instance_of(Price::Distance, @rental.distance_price)
				end
			end
		end
	end

	describe '#options_price' do
		it 'should be an instance of Price::Options' do
			@rental.stub(:options, []) do
				@rental.stub(:period, OpenStruct.new(number_of_days: 5)) do
					assert_instance_of(Price::Options, @rental.options_price)
				end
			end
		end
	end

	describe '#commission' do
		it 'should be an instance of Commission' do
			assert_instance_of(Commission, @rental.commission)
		end
	end

	describe '#actions' do
		it 'should have a length of 5' do
			assert_equal(5, @rental.actions.length)
		end

		it 'should proper actions' do
			driver_action = @rental.actions[0]
			assert_equal('driver', driver_action[:who])
			assert_equal('debit', driver_action[:type])

			driver_action = @rental.actions[1]
			assert_equal('owner', driver_action[:who])
			assert_equal('credit', driver_action[:type])

			driver_action = @rental.actions[2]
			assert_equal('insurance', driver_action[:who])
			assert_equal('credit', driver_action[:type])

			driver_action = @rental.actions[3]
			assert_equal('assistance', driver_action[:who])
			assert_equal('credit', driver_action[:type])

			driver_action = @rental.actions[4]
			assert_equal('drivy', driver_action[:who])
			assert_equal('credit', driver_action[:type])
		end
	end
end
