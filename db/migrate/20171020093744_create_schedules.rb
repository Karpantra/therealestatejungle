class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :mond_start
      t.string :mond_end
      t.string :tue_start
      t.string :tue_end
      t.string :wed_start
      t.string :wed_end
      t.string :thu_start
      t.string :thu_end
      t.string :fri_start
      t.string :fri_end
      t.string :sat_start
      t.string :sat_end
      t.string :sun_start
      t.string :sun_end
      t.boolean :no_stop
      t.references :coworking, foreign_key: true

      t.timestamps
    end
  end
end
