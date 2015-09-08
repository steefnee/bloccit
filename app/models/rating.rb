class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]
  belongs_to :ratable, polymorphic: true
  belongs_to :rate
end
