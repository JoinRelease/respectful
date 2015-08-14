class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :line1
      t.string  :line2
      t.string  :city
      t.string  :state
      t.string  :zip
      t.integer :addressable_id, index: true
      t.string  :addressable_type, index: true

      t.timestamps null: false
    end
  end
end
