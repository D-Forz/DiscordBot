class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :hp, null: false, default: 10
      t.integer :max_hp, null: false, default: 10
      t.integer :attack, null: false, default: 2
      t.integer :defense, null: false, default: 1
      t.integer :xp, null: false, default: 0
      t.integer :gold, null: false, default: 0
      t.integer :level, null: false, default: 1
      t.integer :mp, null: false, default: 10
      t.integer :battling, null: false, default: 0
      t.string :mode, null: false, default: 'normal'
      t.text :inventory, array: true, default: []
      t.integer :user_id, null: false, limit: 8

      t.timestamps
    end
  end
end
