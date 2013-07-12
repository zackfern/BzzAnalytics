class Filter < ActiveRecord::Base
  belongs_to :user
  validates :name, :path, :user_id, presence: true
end
