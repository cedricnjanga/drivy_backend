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
		distance_price.to_i + duration_price.to_i
	end

	def commission
		Commission.new(price, period.number_of_days)
	end

	def distance_price
		Price::Distance.new(car.price_per_km, distance)
	end

	def duration_price
		Price::Duration.new(car.price_per_day, period.number_of_days)
	end
end
