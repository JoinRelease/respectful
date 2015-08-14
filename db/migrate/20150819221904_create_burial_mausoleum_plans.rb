class CreateBurialMausoleumPlans < ActiveRecord::Migration
  def change
    create_table :burial_mausoleum_plans do |t|
      t.string :type_of_mausoleum
      t.string :mausoleum_section
      t.string :mausoleum_section_name
      t.string :height
      t.string :double_plot
      t.references :burial_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
