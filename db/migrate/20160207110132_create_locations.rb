class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :name
      t.text :external_id
      t.text :secret_code

      t.timestamps null: false
    end
  end
end
