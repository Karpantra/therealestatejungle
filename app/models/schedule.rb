class Schedule < ApplicationRecord
  belongs_to :coworking

  HOURS = ["Fermé","0h","1h", "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "10h", "11h", "12h", "13h", "14h", "15h", "16h", "17h", "18h", "19h", "20h", "21h", "22h", "23h", "Minuit"]
end
