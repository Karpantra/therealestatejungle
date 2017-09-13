class Demand < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true
  validates :lease_budget, presence: true
  validates :buy_budget, presence: true
  validates :location_1, presence: true
  validates :surface, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :workstation_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :meeting_room_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :parking_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :surface_type, presence: true
  validates :move_in_date, presence: true


  ZONE = ["Paris Centre - Ouest (arr. 1, 2, 8, 9, 16 ou 17)","Paris Centre - Est (arr. 3, 4, 10, 11 ou 12)", "Paris Nord (18, 19 ou 20)", "Paris Sud (5, 6, 7, 13, 14 ou 15)", "Croissant Ouest (de Asnières à St-Cloud)", "Croissant Est (de Aubervilliers &agrave; Villejuif)", "Deuxième couronne parisienne (ex. Antony, Villepinte, etc.)"]

  SPACES = ["Coworking (espace de travail partagé)", "Open space (espace de travail privatisé)", "Bureaux cloisonnés (espace de travail privatisé avec bureaux fermés)", "Espace mixte (différents espaces de travail privatisés ou non)"]
end


