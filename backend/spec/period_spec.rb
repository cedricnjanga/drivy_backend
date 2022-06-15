require 'minitest/autorun'
require_relative '../lib/period.rb'

describe Period do
	before do
    @period = Period.new(from: '2022-06-14', to: '2022-06-16')
  end

	describe '#initialize' do
		it 'should have required attributes' do
			assert_raises(ArgumentError) { Period.new }

			begin
				Period.new
			rescue ArgumentError => e
				assert_equal(e.message, 'missing keywords: :from, :to')
			end
		end

		it 'should be initialized with string dates' do
			assert_raises(Date::Error) { Period.new(from: 'toto', to: '2022-06-14') }	
			assert_raises(Date::Error) { Period.new(from: '2022-06-14', to: 'toto') }	
		end
	end

	describe '#from' do
		it 'should be a instance of Date' do
			assert_instance_of(Date, @period.from)
		end

		it 'should be the correct date' do
			assert_equal(14, @period.from.day)
			assert_equal(6, @period.from.month)
			assert_equal(2022, @period.from.year)
		end
	end

	describe '#to' do
		it 'should be a instance of Date' do
			assert_instance_of(Date, @period.to)
		end

		it 'should be the correct date' do
			assert_equal(16, @period.to.day)
			assert_equal(6, @period.to.month)
			assert_equal(2022, @period.to.year)
		end
	end


	describe '#number_of_days' do
		it 'should the right integer' do
			assert_equal(1, Period.new(from: '2022-06-14', to: '2022-06-14').number_of_days)
			assert_equal(2, Period.new(from: '2022-06-14', to: '2022-06-15').number_of_days)
			assert_equal(3, @period.number_of_days)
		end
	end
end
