class AddTeaNameToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :tea_name, :string
  end
end
