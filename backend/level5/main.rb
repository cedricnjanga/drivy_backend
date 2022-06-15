require_relative '../lib/database.rb'

db = Database.new 'level5'

output = db.rentals.map do |rental|
	{
		id: rental.id,
		options: rental.options.map(&:type),
		actions: rental.actions
	}
end

db.generate_output_file(output)

