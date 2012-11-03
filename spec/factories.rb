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
		factory :animal do
			name "Cat"
		end
		factory :pet do
			name "Boots"
			female false
			active true
			date_of_birth 10.years.ago
			association :owner
			association :animal
		end
		
		factory :vaccine do
			name "Rabies"
			duration 365 #in days
			association :animal 
		end
	
		factory :visit do
			weight 35
			visit_date 2.days.ago
			notes "This is a note"
			association :pet
			end
		factory :vaccination do
			dosage ".5 ml"
			association vaccine
			association visit
		end
	end
