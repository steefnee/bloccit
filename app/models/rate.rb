class Rate < ActiveRecord::Base
  has_many :ratings
  belongs_to :ratable, polymorphic: true
  has_many :topics, through: :ratings, source: :ratable, source_type: :Topic
  has_many :posts, through: :ratings, source: :ratable, source_type: :Post
end
