class Visit < ActiveRecord::Base
  attr_accessible :id, :notes, :pet_id, :visit_date, :weight
  
  belongs_to :pet
  has_many :vaccinations
  has_many :vaccines, :through => :vaccinations
  
  
  validates :pet_id, :weight, :visit_date, :presence =>true
  validates :weight, :numericality => {:only_integer => true, :greater_than => 0, :allow_blank => true, :allow_nil => true}
  
  scope :chronological, order('visit_date DESC')
  scope :for_pet, lambda{|pet_id| where('pet_id = ?', pet_id)}
  scope :latest, lambda{|num| limit(num).order('visit_date DESC')}  ##to make sure we will get the latest numbers.

end
