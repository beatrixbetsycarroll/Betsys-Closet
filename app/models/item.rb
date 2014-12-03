class Item < ActiveRecord::Base
  # Remember to create a migration!
  validates :description, presence: true

  has_many :item_tag_relationships
  has_many :tags, through: :item_tag_relationships
  belongs_to :user
  has_many :likes
end
