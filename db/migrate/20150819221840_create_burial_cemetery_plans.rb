class CreateBurialCemeteryPlans < ActiveRecord::Migration
  def change
    create_table :burial_cemetery_plans do |t|
      t.string :cemetery_section
      t.string :cemetery_section_name
      t.string :liner_vault_preference
      t.string :headstone_preference
      t.string :double_plot
      t.string :type_of_double_plot
      t.references :burial_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
