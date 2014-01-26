class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :header
      t.string :subheader
      t.text :text
      t.string :image_url
      t.string :image_align
      t.references :page

      t.timestamps
    end
  end
end
