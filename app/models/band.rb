class Band < ActiveRecord::Base
  belongs_to(
  :user,
  :class_name => "User",
  :foreign_key => :owner_id,
  :primary_key => :id
  )
  
  has_many(
  :albums,
  :class_name => "Album",
  :foreign_key => :band_id,
  :primary_key => :id
  )
end
