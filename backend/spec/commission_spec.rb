require 'minitest/autorun'
require_relative '../lib/commission.rb'

describe Commission do
	before do
		@commission = Commission.new 1000, 1

		assert_respond_to(@commission, :total_amount)
		assert_respond_to(@commission, :insurance_fee)
		assert_respond_to(@commission, :assistance_fee)
		assert_respond_to(@commission, :drivy_fee)
		assert_respond_to(@commission, :to_h)
	end

	describe '#total_amount' do
		it 'should represent a third of the rental price' do
			assert_equal(300, @commission.total_amount)
		end
	end

	describe '#insurance_fee' do
		it 'should represent half of commissions total amount' do
			assert_equal(150, @commission.insurance_fee)
		end
	end

	describe '#assistance_fee' do
		it 'should number of days * 100 (1euro + cents)' do
			assert_equal(100, @commission.assistance_fee)
		end
	end

	describe '#drivy_fee' do
		it 'should be the difference between total amount and other fees' do
			assert_equal(50, @commission.drivy_fee)
		end
	end
end
