class AddIvAndKeyToStorage < ActiveRecord::Migration[5.0]
  def change
    add_column :storages, :iv, :binary
    add_column :storages, :key, :binary
  end
end
