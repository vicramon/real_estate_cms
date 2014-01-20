class AddLogoUrlToSites < ActiveRecord::Migration
  def change
    add_column :sites, :logo_url, :string
  end
end
