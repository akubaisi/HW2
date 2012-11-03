class CreateVaccinations < ActiveRecord::Migration
  def change
    create_table :vaccinations do |t|
      t.integer :id
      t.integer :vaccine_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
