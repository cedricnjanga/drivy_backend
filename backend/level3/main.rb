require_relative '../lib/database.rb'

db = Database.new 'level3'

output = db.rentals.map do |rental|
	{ id: rental.id, price: rental.price, commission: rental.commission.to_h }
end

db.generate_output_file(output)

