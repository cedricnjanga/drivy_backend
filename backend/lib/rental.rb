require_relative './period'
require_relative './price'
require_relative './commission'

class Rental
	attr_reader :id, :car_id, :db, :period, :distance, :price

	def initialize id:, car_id:, db:, start_date:, end_date:, distance:
		@id = id
		@car_id = car_id
		@db = db
		@period = Period.new from: start_date, to: end_date
		@distance = distance
	end

	def car
		db.cars.find { |car| car.id === car_id}
	end

	def price
		price_without_options + options_price.to_i
	end

	def commission
		Commission.new(price_without_options, period.number_of_days)
	end

	def actions
		[
			{ who: 'driver', type: 'debit', amount: price },
			{ who: 'owner', type: 'credit', amount: price - (commission.total_amount + options_price.additional_insurance) },
			{ who: 'insurance', type: 'credit', amount: commission.insurance_fee },
			{ who: 'assistance', type: 'credit', amount: commission.assistance_fee },
			{ who: 'drivy', type: 'credit', amount: commission.drivy_fee + options_price.additional_insurance },
		]
	end

	def options
		db.options.select { |option| option.rental_id === id }
	end

	def price_without_options
		distance_price.to_i + duration_price.to_i
	end

	def distance_price
		Price::Distance.new(car.price_per_km, distance)
	end

	def duration_price
		Price::Duration.new(car.price_per_day, period.number_of_days)
	end

	def options_price
		Price::Options.new(options, period.number_of_days)
	end
end
