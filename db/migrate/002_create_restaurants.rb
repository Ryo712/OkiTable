class CreateRestaurants < ActiveRecord::Migration[7.0]
  def up
    create_table :restaurants do |t|
      t.string :name, limit: 200, null: false
      t.text :description
      t.string :address, limit: 300, null: false
      t.string :phone, limit: 20
      t.string :email, limit: 255
      t.string :image_url, limit: 500
      t.string :restaurant_city, limit: 100
      t.boolean :is_active, default: true
      t.time :open_time, default: '11:00:00'
      t.time :close_time, default: '22:00:00'
      t.integer :time_slot_interval, default: 60
      t.timestamps null: false
      
      t.index :restaurant_city
      t.index :is_active
      t.index [:open_time, :close_time]
    end
  end
  
  def down
    drop_table :restaurants
  end
end
