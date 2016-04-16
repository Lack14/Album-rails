class ChangeColorForAlbums < ActiveRecord::Migration
  def change
    change_column :albums, :color, :string
  end
end
