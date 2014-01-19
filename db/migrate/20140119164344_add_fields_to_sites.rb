class AddFieldsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :address, :text
    add_column :sites, :city, :text
    add_column :sites, :state, :text
    add_column :sites, :zip, :text
    add_column :sites, :phone, :text
    add_column :sites, :fax, :text
    add_column :sites, :facebook_url, :text
    add_column :sites, :twitter, :text
    add_column :sites, :google_plus_url, :text
  end
end
