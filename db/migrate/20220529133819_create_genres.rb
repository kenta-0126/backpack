class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :name
      t.timestamps
    end
  end
end
