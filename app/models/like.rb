class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :item
  validates :user, uniqueness: {scope: :item}
end
