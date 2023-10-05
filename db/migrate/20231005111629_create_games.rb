class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :introduction, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
