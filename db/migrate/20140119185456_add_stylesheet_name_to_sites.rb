class AddStylesheetNameToSites < ActiveRecord::Migration
  def change
    add_column :sites, :stylesheet_name, :string
  end
end
