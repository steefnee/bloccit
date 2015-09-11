class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]
  belongs_to :rateable, polymorphic: true


end
