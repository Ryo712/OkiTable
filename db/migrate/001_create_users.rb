class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :name, limit: 100, null: false
      t.string :email, limit: 255, null: false
      t.string :password_hash, limit: 255, null: false
      t.string :role, limit: 20, default: 'user'
      t.timestamps null: false
      
      t.index :email, unique: true
      t.index :role
    end
    
    # CHECK制約を追加（roleカラムの値制限）
    execute "ALTER TABLE users ADD CONSTRAINT check_role CHECK (role IN ('user', 'admin'))"
  end
  
  def down
    drop_table :users
  end
end
