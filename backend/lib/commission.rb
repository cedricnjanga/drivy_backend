class Commission
	attr_reader :rental_price, :number_of_days

	def initialize rental_price, number_of_days
		@rental_price = rental_price
		@number_of_days = number_of_days
	end

	def total_amount
		(rental_price * 30) / 100
	end

	def insurance_fee
		(total_amount / 2).to_i
	end

	def assistance_fee
		number_of_days * 100
	end

	def drivy_fee
		total_amount - (insurance_fee + assistance_fee)
	end

	def to_h
		{
			insurance_fee: insurance_fee,
			assistance_fee: assistance_fee,
			drivy_fee: drivy_fee
		}
	end
end
