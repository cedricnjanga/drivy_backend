require 'date'

class Period
	attr_reader :from, :to

	def initialize from:, to:
		@from = Date.parse from
		@to = Date.parse to
	end

	def number_of_days
		(to.mjd - from.mjd) + 1 
	end
end
