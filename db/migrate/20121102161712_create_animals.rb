class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
