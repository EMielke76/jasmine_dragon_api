class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :street_adress
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
