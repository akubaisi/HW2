class Owner < ActiveRecord::Base
  attr_accessible :active, :city, :country, :email, :first_name, :last_name, :phone, :street
  before_save :format_phone
  COUNTRIES =[['Qatar', 'QA'],['Saudi Arabia', 'KSA'],['United Arab Emirates','UAE']]

  
  validates :first_name, :last_name, :email, :phone, :presence =>true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\d{11}|\+?\d{3}?[-.]\d{4}[-.]\d{4})$/, :message => "should be 11 digits (country code needed) and deliminer... "
  validates_inclusion_of :countries, :in => %[QA KSA UAE], :message => "is not an option", :allow_nil =>true, :allow_blank => true







	private

		def format_phone
			phone = self.phone.to_s
			phone.gsub!(/[^0-9]/, "")
			self.phone = phone
		end


  
  end
