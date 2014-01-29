class AddNavTypeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :header_type, :string
  end
end
