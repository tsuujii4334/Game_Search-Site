class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.text :comment_writing, null: false
      t.timestamps
    end
  end
end
