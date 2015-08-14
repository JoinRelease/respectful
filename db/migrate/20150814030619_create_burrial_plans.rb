class CreateBurrialPlans < ActiveRecord::Migration
  def change
    create_table :burrial_plans do |t|
      t.boolean :public_service
      t.boolean :open_casket
      t.boolean :private_viewing
      t.boolean :religious_cultural_service
      t.string  :religion_culture_type
      t.string  :type_of_service_space
      t.string  :address_of_service_space
      t.boolean :burrial_space_in_mind
      t.string  :address_of_burrial_space
      t.boolean :burrial_space_owned
      t.boolean :completed
      t.boolean :sent

      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
