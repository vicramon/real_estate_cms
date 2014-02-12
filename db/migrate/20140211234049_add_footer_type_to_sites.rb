class AddFooterTypeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :footer_type, :string
  end
end
