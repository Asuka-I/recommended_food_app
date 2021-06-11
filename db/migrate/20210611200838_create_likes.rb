class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :food_id, null: false, foreign_key: true

      t.timestamps

      add_index :likes, [:user_id, :food_id], unique: true
    end
  end
end
