class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :phone
      t.string :address
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
