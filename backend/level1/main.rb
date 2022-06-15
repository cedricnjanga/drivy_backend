require_relative '../lib/database.rb'

db = Database.new 'level1'

output = db.rentals.map { |rental| { id: rental.id, price: rental.price } }

db.generate_output_file(output)
