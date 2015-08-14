class CreatePlanDates < ActiveRecord::Migration
  def change
    create_table :plan_dates do |t|
      t.datetime
      t.references :burrial_plan, index: true, foreign_key: true
      t.references :cremation_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
