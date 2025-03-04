class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :cellphone
      t.boolean :admin, default: false
      t.string :oab

      t.timestamps
    end
  end
end
