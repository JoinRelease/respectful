class CreatePlanDates < ActiveRecord::Migration
  def change
    create_table :plan_dates do |t|
      t.datetime  :date
      t.integer :dateable_id
      t.string :dateable_type

      t.timestamps null: false
    end
  end
end
