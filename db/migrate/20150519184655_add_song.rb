class AddSong < ActiveRecord::Migration
  def change

    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.timestamps
    end  

  end

end
