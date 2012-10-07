require 'factory_girl'
	
	FactoryGirl.define do
		factory :owner do
			first_name "Joey"
			last_name "Phelps"
			street "abe aldardaa"
			country "QA"
			city "Doha"
			email "joey@joeyphelps.com"
			phone "97444548624"
			active true
		end
	end
