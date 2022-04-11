class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.string :tea_id
      t.integer :price
      t.integer :status
      t.integer :frequency

      t.timestamps
    end
  end
end
