class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :garage_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
