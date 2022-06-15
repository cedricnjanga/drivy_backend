require_relative '../lib/database.rb'

db = Database.new 'level4'

output = db.rentals.map do |rental|
	{ id: rental.id, actions: rental.actions }
end

db.generate_output_file(output)

