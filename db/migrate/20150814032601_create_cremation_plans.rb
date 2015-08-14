class CreateCremationPlans < ActiveRecord::Migration
  def change
    create_table :cremation_plans do |t|
      t.boolean :public_service
      t.boolean :open_casket
      t.boolean :private_viewing
      t.boolean :religious_cultural_service
      t.string  :religion_culture_type
      t.string  :type_of_service_space
      t.string  :address_of_service_space
      t.boolean :present_during_cremation
      t.string  :place_of_ash_storage
      t.string  :address_of_ash_storage
      t.boolean :ash_storage_space_owned
      t.string  :ash_transit_type
      t.string  :address_to_deliver_ash
      t.boolean :completed
      t.boolean :sent

      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
