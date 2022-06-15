module Price
	class Duration
		attr_reader :number_of_days, :price_per_day

		def initialize price_per_day, number_of_days
			@price_per_day = price_per_day
			@number_of_days = number_of_days
		end

		def to_i
			((full_price_days * 1) * price_per_day +
			(ten_percent_price_days * 0.9) * price_per_day +
			(thirty_percent_price_days * 0.7) * price_per_day +
			(half_price_days * 0.5) * price_per_day).to_i
		end

		def full_price_days
			1
		end

		def ten_percent_price_days
			number_of_days > 1 ? [number_of_days - 1, 3].min : 0
		end

		def thirty_percent_price_days
			number_of_days > 4 ? [number_of_days - 4, 6].min : 0
		end

		def half_price_days
			number_of_days > 10 ? [number_of_days - 10, 0].max : 0
		end
	end

	class Distance
		attr_reader :distance, :price_per_km

		def initialize price_per_km, distance
			@price_per_km = price_per_km
			@distance = distance
		end

		def to_i
			(distance * price_per_km).to_i
		end
	end
end
