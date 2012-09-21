# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  reference  :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :name, :reference, :latitude, :longitude
  has_many :waittimes, dependent: :destroy

  validates :reference, presence: true,
  uniqueness: true

  def average
     @count=0
     @sum=0
     @waittimes=waittimes.all
       @waittimes.each do |x| 
        if x.updated_at> Time.now-1.hour
          @sum+=x.content.to_f
          @count+=1
        end
      end
    if @count!=0
     return @sum/@count
   end
 else
  return -1
  end


end
