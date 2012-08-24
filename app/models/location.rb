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
  attr_accessible :name, :reference
  has_many :waittimes, dependent: :destroy

  validates :reference, presence: true,
  uniqueness: true
end
