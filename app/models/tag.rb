class Tag < ActiveRecord::Base
  # Remember to create a migration!
  validates :tag, presence: true

  has_many :item_tag_relationships
  has_many :items, through: :item_tag_relationships
end
