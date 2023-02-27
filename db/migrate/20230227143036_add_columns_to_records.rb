class AddColumnsToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :title, :string
    add_column :records, :genre, :string
    add_column :records, :price, :integer
    add_column :records, :location, :string
    add_column :records, :artist, :string
  end
end
