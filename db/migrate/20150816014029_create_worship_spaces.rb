class CreateWorshipSpaces < ActiveRecord::Migration
  def change
    create_table :worship_spaces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
