class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate_id
      t.integer :topic_id
      t.references :rate, index: true
      t.references :topic, index: true
      t.references :post, index: true
# #3
      t.references :ratable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :ratings, :labels
    add_foreign_key :ratings, :topics
    add_foreign_key :ratings, :posts
  end
end