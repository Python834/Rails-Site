class Review < ActiveRecord::Base
  belongs_to :blog
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
