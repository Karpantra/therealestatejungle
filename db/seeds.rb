# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

puts "deleting items from database"
Equipment.destroy_all
puts "done"
puts "starting seed"

csv_equipments = File.read(Rails.root.join('lib', 'seeds', 'equipments.csv'))
csv = CSV.parse(csv_equipments, :headers => true, col_sep: ';')
csv.each do |row|
  equipment = Equipment.new(name: row["name"], icon: row["icon"])
  equipment.save
end

puts "equipments loaded"












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












