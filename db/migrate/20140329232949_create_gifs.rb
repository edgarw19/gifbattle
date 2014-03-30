class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.text :link
      t.integer :votes

      t.timestamps
    end
  end
end
