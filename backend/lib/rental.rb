require_relative './period'

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
		(distance_price + duration_price).to_i
	end

	def distance_price
		distance * car.price_per_km
	end

	def duration_price
		period.number_of_days * car.price_per_day
	end
end
