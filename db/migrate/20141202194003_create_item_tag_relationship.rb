class CreateItemTagRelationship < ActiveRecord::Migration
  def change
    create_table :item_tag_relationship do |t|
      t.references :tag
      t.references :item
    end
  end
end
