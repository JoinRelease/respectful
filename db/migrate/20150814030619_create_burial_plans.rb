class CreateBurialPlans < ActiveRecord::Migration
  def change
    create_table :burial_plans do |t|
      t.boolean :public_service
      t.boolean :open_casket
      t.boolean :private_viewing
      t.boolean :religious_cultural_service
      t.string  :religion_culture_type
      t.string  :type_of_service_space
      t.boolean :worship_space_in_mind
      t.string  :worship_space
      t.boolean :burial_space_in_mind
      t.boolean :burial_space_owned
      t.boolean :completed
      t.boolean :sent
      t.references :passing, index: true, foreign_key: true

      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
