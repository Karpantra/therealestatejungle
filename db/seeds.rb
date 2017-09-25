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







# items = ["Cuisine", "bar", "Douches", "Vestiaires", "Salle d'attente", "Terrasse", "Jardin", "Climatisation", "Accés PMR", "Local à vélos", "Parkings", "Zone de stockage", "Alarme", "Salle de repos", "Ascenseurs", "Espaces communs", "Salle ERP", "Auditorium", "Wifi", "Fibre optique", "Ordinateurs", "Prises RJ45", "Téléphone", "Fax", "Photocopieurs", "Rétroprojecteur", "Ecrans", "Télévision", "Paper board", "Mobilier", "Domiciliation", "Service de nettoyage", "Service de réception", "Gestion des courriers et colis", "Fournitures de bureau", "Evènements professionnels", "Rencontres informelles" ]


# icons = ["kitchen.svg", "bar.svg", "shower.svg", "locker.svg", "waiting-room.svg", "terrasse.svg", "jardin.svg", "air-conditioning.svg", "pmr.svg", "bike.svg", "parkings.svg", "storage.svg", "alarm.svg", "common-space.svg", "lift.svg", "meeting.svg", "erp.svg", "auditorium.svg", "wifi.svg", "optic-fiber.svg", "ordinateur.svg", "rj45.svg", "phone.svg","fax.svg", "photocopier.svg", "retropro.svg", "ecran.svg", "board.svg", "desk.svg", "domiciliation.svg", "cleaning.svg", "accueil.svg", "mail-management.svg", "desk-furniture.svg", "event-pro.svg", "unformal-meeting.svg"]


# items.each do |item|
#   Equipment.create(name: item)
# end


# icons.each do |icon|
#   Equipment.update(icon: icon)
#   end

#   # Equipment.all.each do |equipment|
#   #   icons.each do |icon|
#   #     equipment.icon = icon
#   #     equipment.save
#   #   end
#   # end












