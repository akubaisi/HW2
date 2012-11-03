class Pet < ActiveRecord::Base
  attr_accessible :active, :animal_id, :date_of_birth, :female, :id, :name, :owner_id

  belongs_to :owner
  belongs_to :animal
  has_many :visits
  
  validates :name, :animal_id, :presence =>true
 
  scope :alphabetical, order('name')
  scope :active, where('active = ?', true)
  scope :female, where('female = ?', true)
  scope :male, where('female = ?', false)
  
  scope :for_owner, lambda{|owner_id| where('owner_id = ?', owner_id)}
  scope :by_animal, lambda{|animal_id| where('animal_id = ?', animal_id)}
  scope :born_before, lambda{|dob| where('date_of_birth = ?', dob)}
 end
