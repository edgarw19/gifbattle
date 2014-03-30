class AddAgreeToGif < ActiveRecord::Migration
  def change
    add_column :gifs, :agree, :double
  end
end
