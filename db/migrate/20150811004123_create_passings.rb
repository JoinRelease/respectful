class CreatePassings < ActiveRecord::Migration
  def change
    create_table :passings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :relation
      t.date :date_of_birth
      t.date :date_of_passing
      t.string :location_of_passing

      t.timestamps null: false
    end
  end
end
