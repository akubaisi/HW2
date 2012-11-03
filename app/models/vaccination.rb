class Vaccination < ActiveRecord::Base
  attr_accessible :id, :vaccine_id, :visit_id
  	belongs_to :visit
	belongs_to :vaccine
	
  
  scope :latest, lambda{|num| limit(num).order('visit_date DESC')}  ##to make sure we will get the latest numbers.

  scope :chronological, joins(:visit) #edit
  scope :for_vaccine, lambda{|vaccine_id| where('vaccine_id = ?', vaccine_id)}
 
  scope :for_visit, lambda{|visit_id| where('visit_id = ?', visit_id)}
 
 private


def vaccine_offered_by_QATS
		vaccOffer == false
	if self.vaccine_id.exists? 
		vaccOffer == true
	end
	if vaccOffer == false
	print "Error, the vaccination is not offered by QATS."
	end
end

def vaccine_matches_animal_type
	vaccMatch == false
	if @vaccine.id == self.vaccine_id 
		vaccMatch == true
	end
	if vaccMatch == false
	print "Error, the vaccination does not match the animal type."
	end
end

end
