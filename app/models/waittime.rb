class Waittime < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :location
  
  validates :location_id, presence: true

  default_scope order: 'waittimes.created_at DESC'


end
