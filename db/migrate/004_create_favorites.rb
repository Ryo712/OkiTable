class CreateFavorites < ActiveRecord::Migration[7.0]
  def up
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.timestamp :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      
      # 外部キー制約
      t.foreign_key :users, column: :user_id, on_delete: :cascade
      t.foreign_key :restaurants, column: :restaurant_id, on_delete: :cascade
      
      # インデックス作成
      t.index :user_id
      t.index :restaurant_id
      
      # UNIQUE制約（同じユーザーが同じレストランを重複してお気に入り登録することを防ぐ）
      t.index [:user_id, :restaurant_id], unique: true
    end
  end
  
  def down
    drop_table :favorites
  end
end
