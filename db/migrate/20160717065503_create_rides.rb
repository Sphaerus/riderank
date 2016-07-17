class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :user, index: true, foreign_key: true
      t.float :price
      t.float :distance

      t.timestamps null: false
    end
  end
end
