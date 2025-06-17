class CreateBookings < ActiveRecord::Migration[7.0]
  def up
    create_table :bookings do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.date :booking_date, null: false
      t.time :booking_time, null: false
      t.integer :party_size, null: false
      t.string :status, limit: 20, default: 'confirmed'
      t.string :user_name, limit: 100, null: false
      t.string :user_email, limit: 255, null: false
      t.string :user_phone, limit: 20
      t.timestamps null: false
      
      # 外部キー制約
      t.foreign_key :users, column: :user_id, on_delete: :cascade
      t.foreign_key :restaurants, column: :restaurant_id, on_delete: :cascade
      
      # インデックス作成
      t.index :user_id
      t.index :restaurant_id
      t.index :booking_date
      t.index :status
      
      # UNIQUE制約（同じレストランの同じ日時には1つの予約のみ）
      t.index [:restaurant_id, :booking_date, :booking_time], unique: true
    end
    
    # CHECK制約を追加
    execute "ALTER TABLE bookings ADD CONSTRAINT bookings_party_size_check CHECK (party_size > 0 AND party_size <= 20)"
    execute "ALTER TABLE bookings ADD CONSTRAINT bookings_status_check CHECK (status IN ('confirmed', 'cancelled', 'completed', 'no_show'))"
  end
  
  def down
    drop_table :bookings
  end
end
