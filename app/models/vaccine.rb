class Vaccine < ActiveRecord::Base
  attr_accessible :animal_id, :duration, :id, :name
  
  belongs_to :animal
  has_many :vaccinations
  has_many :visits, :through => :vaccinations
  
before_save :check_vaccine_duration

validates :name, :animal_id, :presence => true
validates :duration, :numericality => {:only_integer => true, :greater_than => 0, :allow_blank => true, :allow_nil => true}

scope :alphabetical, order('name')
scope :for_animal, lambda{|animal_id| where('animal_id = ?', animal_id)}

private

def check_vaccine_duration
	dur = self.duration
	self.duration = 7300 if dur.nil? || dur.blank?
end
end
