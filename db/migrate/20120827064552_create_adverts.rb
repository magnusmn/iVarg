class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :body
      t.integer :bid
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
