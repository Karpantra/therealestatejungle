require "csv"

puts "deleting items from database"
Category.destroy_all
Contract.destroy_all
Type.destroy_all
Landlord.destroy_all
puts "done"
puts "starting seed"

csv_categories = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
csv = CSV.parse(csv_categories, :headers => true, col_sep: ';')
csv.each do |row|
  category = Category.new(name: row["name"], icon: row["icon"])
  category.save
end

puts "categories loaded"

csv_contracts = File.read(Rails.root.join('lib', 'seeds', 'contracts.csv'))
csv = CSV.parse(csv_contracts, :headers => true, col_sep: ';')
csv.each do |row|
  contract = Contract.new(name: row["name"])
  contract.save
end

puts "contracts loaded"

csv_types = File.read(Rails.root.join('lib', 'seeds', 'types.csv'))
csv = CSV.parse(csv_types, :headers => true, col_sep: ';')
csv.each do |row|
  type = Type.new(name: row["name"])
  type.save
end

puts "types loaded"

csv_landlords = File.read(Rails.root.join('lib', 'seeds', 'landlords.csv'))
csv = CSV.parse(csv_landlords, :headers => true, col_sep: ';')
csv.each do |row|
  landlord = Landlord.new(name: row["name"])
  landlord.save
end

puts "landlords loaded"
