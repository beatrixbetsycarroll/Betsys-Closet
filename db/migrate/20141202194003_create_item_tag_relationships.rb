class CreateItemTagRelationships < ActiveRecord::Migration
  def change
    create_table :item_tag_relationships do |t|
      t.references :tag
      t.references :item
    end
  end
end
