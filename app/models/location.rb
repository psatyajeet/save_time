class Location < ActiveRecord::Base
  attr_accessible :name, :reference

  validates :reference, presence: true,
  						uniqueness: true
end
