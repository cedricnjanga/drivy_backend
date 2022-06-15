class Option
	attr_reader :id, :rental_id, :type

	def initialize id:, rental_id:, type:
		@id = id
		@rental_id = rental_id
		@type = type
	end

	def price_per_day
		case type
			when 'gps' then 500
			when 'baby_seat' then 200
			when 'additional_insurance' then 1000
		end
	end
end
