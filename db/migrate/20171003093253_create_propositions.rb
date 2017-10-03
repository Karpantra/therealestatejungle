class CreatePropositions < ActiveRecord::Migration[5.0]
  def change
    create_table :propositions do |t|
      t.integer :workstation_number
      t.integer :office_surface
      t.integer :storage_surface
      t.integer :parking_number
      t.string :lease_start
      t.string :mad_start
      t.integer :office_charge_per_sqm
      t.integer :office_rent_per_sqm
      t.integer :office_taxe_per_sqm
      t.integer :office_teom_per_sqm
      t.integer :workstation_price_per_month
      t.integer :workstation_price_per_day
      t.integer :workstation_price_per_hour
      t.integer :storage_price_per_sqm
      t.integer :parking_price_per_unit
      t.string :indexation
      t.boolean :fiscal_status
      t.integer :deposit
      t.integer :lease_duration
      t.integer :fitout_allowance_in_month
      t.integer :free_rent_in_month
      t.references :brief, foreign_key: true

      t.timestamps
    end
  end
end
