class CreateAudiences < ActiveRecord::Migration[8.0]
  def change
    create_table :audiences do |t|
      t.string :number
      t.string :state
      t.string :city
      t.string :address
      t.datetime :date_time
      t.float :price
      t.float :expense
      t.string :status
      t.references :user, null: true, foreign_key: true
      t.boolean :notifications

      t.timestamps
    end
  end
end
