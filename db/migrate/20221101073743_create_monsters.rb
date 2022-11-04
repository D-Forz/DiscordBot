class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name, null: false
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :xp, null: false
      t.integer :gold, null: false
      t.integer :min_level, null: false
      t.string :type
      t.timestamps
    end
  end
end
