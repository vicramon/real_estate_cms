class AddSiteIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :site, index: true
  end
end
