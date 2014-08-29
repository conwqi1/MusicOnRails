class Album < ActiveRecord::Base
  has_many(
    :tracks,
    :class_name => "Track",
    :foreign_key => :album_id,
    :primary_key => :id
  )
  
  belongs_to(
    :band,
    :class_name => "Band",
    :foreign_key => :band_id,
    :primary_key => :id
  )
  
  has_one :user, through: :band, source: :user
end
