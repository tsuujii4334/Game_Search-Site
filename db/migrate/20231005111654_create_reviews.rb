class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :review_writing, null: false
      t.timestamps
    end
  end
end
