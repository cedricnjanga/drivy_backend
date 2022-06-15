require 'json'

require_relative './car.rb'
require_relative './period.rb'
require_relative './rental.rb'

class Database
	attr_reader :level

	def initialize level
		@level = level
	end

	def file
		@file ||= File.read(input_filepath)
	end

	def data
		@data ||= JSON.parse(file)
	end
	
	def cars
		@cars ||= data['cars'].map do |hash|
			attributes = hash.transform_keys(&:to_sym)

			Car.new(**attributes)
		end
	end

	def rentals
		@rentals ||= data['rentals'].map do |hash|
			attributes = hash.transform_keys(&:to_sym)

			Rental.new(db: self, **attributes)
		end
	end

	def generate_output_file(output)
		File.open(output_filepath, 'w') { |f| f.write JSON.pretty_generate(rentals: output) }
	end

	private

	def base_path
		File.expand_path("../#{level}", __dir__)
	end

	def input_filepath
		File.join(base_path, 'data/input.json')
	end

	def output_filepath
		File.join(base_path, 'data/output.json')
	end
end
