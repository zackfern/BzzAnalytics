class Visit < ActiveRecord::Base
  belongs_to :filter
  validates :path, uniqueness: true
end
