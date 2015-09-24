class AddTypeOfToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :type_of, :string, index: true
  end
end
