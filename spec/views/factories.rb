require 'factory_girl'
	
	FactoryGirl.define do
		factory :owner do
			first_name "Joey"
			last_name "Phelps"
			address "PO Box 24866"
			country "QA"
			email "joey@joeyphelps.com"
			phone "97444548624"
			active true
		end
	end
