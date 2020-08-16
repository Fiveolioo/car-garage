class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
