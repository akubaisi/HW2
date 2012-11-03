class Owner < ActiveRecord::Base
  attr_accessible :id, :active, :city, :country, :email, :first_name, :last_name, :phone, :street
  
  before_save :format_phone
  has_many :pets
  
  validates :first_name, :last_name, :email, :phone, :presence =>true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) and deliminer... "
  validates_inclusion_of :country, :in => %[QA KSA UAE], :message => "is not an option", :allow_nil =>true, :allow_blank => true
  :COUNTRIES == [['Qatar', 'QA'],['Saudi Arabia', 'KSA'],['United Arab Emirates','UAE']]

  


		scope :alphabetical, order('last_name, first_name')

		scope :active, where('active = ?', true) 				#think about SQL

		def proper_name
			first_name + " " + last_name
		end
		
		def name
			last_name + ", " + first_name
		end
		
		private
			def format_phone 	
				phone = self.phone.to_s 				 
				phone.gsub!(/[^0-9]/, "")				 
				self.phone = phone 			  			 
			end


  
  end
