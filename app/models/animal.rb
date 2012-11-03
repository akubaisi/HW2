class Animal < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :pets
  has_many :vacines
  
  validates :name, :presence =>true
 
end
